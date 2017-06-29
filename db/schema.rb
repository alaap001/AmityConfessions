# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170627194158) do

  create_table "about_amitians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "bio",                 limit: 65535
    t.string   "catch_phrase"
    t.string   "dob"
    t.string   "interest"
    t.string   "relationship_status"
    t.integer  "amitian_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "graduation_year"
    t.string   "course"
    t.text     "memories",            limit: 65535
  end

  create_table "amitians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "fullname"
    t.string   "nickname"
    t.string   "profilepic"
    t.string   "campus"
    t.string   "institute"
    t.string   "cover"
    t.text     "bio",                    limit: 65535
    t.string   "gender"
    t.boolean  "alumni",                               default: false
    t.datetime "last_sign_out_at"
    t.index ["campus"], name: "index_amitians_on_campus", using: :btree
    t.index ["email"], name: "index_amitians_on_email", unique: true, using: :btree
    t.index ["institute"], name: "index_amitians_on_institute", using: :btree
    t.index ["reset_password_token"], name: "index_amitians_on_reset_password_token", unique: true, using: :btree
  end

  create_table "clubmembers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "club_id"
    t.integer  "amitian_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "accepted",   default: false
    t.string   "roles"
    t.index ["amitian_id", "club_id"], name: "index_clubmembers_on_amitian_id_and_club_id", unique: true, using: :btree
    t.index ["amitian_id"], name: "index_clubmembers_on_amitian_id", using: :btree
    t.index ["club_id"], name: "index_clubmembers_on_club_id", using: :btree
  end

  create_table "clubposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "club_id"
    t.integer  "amitian_id"
    t.text     "content",        limit: 65535
    t.string   "clubpost_image"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["amitian_id"], name: "index_clubposts_on_amitian_id", using: :btree
    t.index ["club_id"], name: "index_clubposts_on_club_id", using: :btree
  end

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amitian_id"
    t.string   "clubname",      limit: 50
    t.string   "club_theme"
    t.text     "description",   limit: 65535
    t.string   "club_themepic"
    t.string   "club_cover"
    t.string   "niche"
    t.string   "website"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "clubscomments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "clubpost_id"
    t.integer  "amitian_id"
    t.text     "content",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["amitian_id"], name: "index_clubscomments_on_amitian_id", using: :btree
    t.index ["clubpost_id"], name: "index_clubscomments_on_clubpost_id", using: :btree
  end

  create_table "confessioncomments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amitian_id"
    t.string   "content"
    t.integer  "confession_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "confessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "confession",              limit: 65535
    t.string   "confessionimage"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "postid"
    t.integer  "cached_votes_total",                    default: 0
    t.integer  "cached_votes_score",                    default: 0
    t.integer  "cached_votes_up",                       default: 0
    t.integer  "cached_votes_down",                     default: 0
    t.integer  "cached_weighted_score",                 default: 0
    t.integer  "cached_weighted_total",                 default: 0
    t.float    "cached_weighted_average", limit: 24,    default: 0.0
    t.integer  "amitian_id"
    t.index ["cached_votes_down"], name: "index_confessions_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_confessions_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_confessions_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_confessions_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_confessions_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_confessions_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_confessions_on_cached_weighted_total", using: :btree
  end

  create_table "conversations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true, using: :btree
  end

  create_table "eventcomments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "eventpost_id"
    t.integer  "amitian_id"
    t.text     "content",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["amitian_id"], name: "index_eventcomments_on_amitian_id", using: :btree
    t.index ["eventpost_id"], name: "index_eventcomments_on_eventpost_id", using: :btree
  end

  create_table "eventmembers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.integer  "amitian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amitian_id"], name: "index_eventmembers_on_amitian_id", using: :btree
    t.index ["event_id", "amitian_id"], name: "index_eventmembers_on_event_id_and_amitian_id", unique: true, using: :btree
    t.index ["event_id"], name: "index_eventmembers_on_event_id", using: :btree
  end

  create_table "eventposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.integer  "amitian_id"
    t.text     "content",          limit: 65535
    t.string   "event_post_image"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["amitian_id"], name: "index_eventposts_on_amitian_id", using: :btree
    t.index ["event_id"], name: "index_eventposts_on_event_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amitian_id"
    t.string   "eventtheme"
    t.string   "location"
    t.datetime "start"
    t.datetime "endtime"
    t.text     "description",    limit: 65535
    t.string   "tags"
    t.string   "event_themepic"
    t.string   "department"
    t.string   "niche"
    t.integer  "club_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "amitian_id"
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "friendships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amitian_id"
    t.integer  "friend_id"
    t.boolean  "accepted",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["amitian_id", "friend_id"], name: "index_friendships_on_amitian_id_and_friend_id", unique: true, using: :btree
  end

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "g1"
    t.string   "g2"
    t.string   "g3"
    t.string   "g4"
    t.string   "g5"
    t.string   "g6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "amitian_id"
  end

  create_table "hotlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "hotlister_id"
    t.integer  "hotlisted_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["hotlisted_id", "hotlister_id"], name: "index_hotlists_on_hotlisted_id_and_hotlister_id", unique: true, using: :btree
    t.index ["hotlisted_id"], name: "index_hotlists_on_hotlisted_id", using: :btree
    t.index ["hotlister_id"], name: "index_hotlists_on_hotlister_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "body",            limit: 65535
    t.integer  "amitian_id"
    t.integer  "conversation_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["amitian_id"], name: "index_messages_on_amitian_id", using: :btree
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amitian_id"
    t.integer  "notified_by_id"
    t.integer  "confession_id"
    t.string   "notice_type"
    t.integer  "identifier"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "club_id"
    t.index ["amitian_id"], name: "index_notifications_on_amitian_id", using: :btree
    t.index ["club_id"], name: "index_notifications_on_club_id", using: :btree
    t.index ["confession_id"], name: "index_notifications_on_confession_id", using: :btree
    t.index ["notified_by_id"], name: "index_notifications_on_notified_by_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "clubmembers", "amitians"
  add_foreign_key "clubmembers", "clubs"
  add_foreign_key "clubposts", "amitians"
  add_foreign_key "clubposts", "clubs"
  add_foreign_key "clubscomments", "amitians"
  add_foreign_key "clubscomments", "clubposts"
  add_foreign_key "eventcomments", "amitians"
  add_foreign_key "eventcomments", "eventposts"
  add_foreign_key "eventmembers", "amitians"
  add_foreign_key "eventmembers", "events"
  add_foreign_key "eventposts", "amitians"
  add_foreign_key "eventposts", "events"
  add_foreign_key "messages", "amitians"
  add_foreign_key "messages", "conversations"
  add_foreign_key "notifications", "amitians"
  add_foreign_key "notifications", "amitians", column: "notified_by_id"
  add_foreign_key "notifications", "clubs"
  add_foreign_key "notifications", "confessions"
end
