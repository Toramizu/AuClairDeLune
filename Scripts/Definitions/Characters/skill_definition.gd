class_name SkillDefinition extends Resource

enum SkillLevel {NOVICE, AMATEUR, SKILLED, EXPERT, MASTER, LEGENDARY} 

@export var id : String
@export var full_name : String
@export var type : String
@export var stat : String
@export var icon : Image
@export var default_level : SkillLevel
