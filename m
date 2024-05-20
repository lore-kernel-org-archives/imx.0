Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD450261
	for <imx@lists.linux.dev>; Mon, 20 May 2024 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716200941; cv=none; b=UXvaAH8PI+mmzvUp3/qkuRZtq2lz/yijEnOanM4//MuIS1kGQARoFrzDp5j9cPfGiXy9ZJlthMEqQAypD/0gMGrj0ZZD7wsfDCkv8tw3esArAwU5zslkRqpZnwkkXsGG5C+wPaKP+f+vF6f//1A9Lxp9bqC5ti6+6hA3qi8VfrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716200941; c=relaxed/simple;
	bh=mrshEGkdz26OZtsX8o9hT7T5ICXR5AksG2MMAvm/FBU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uwhYYysWXy6RBXNh5xRqJn56eTW2itykh/sxDpiajeKMgjmYnaUOUrCukIw1+GqJihcmEtPyxq1rdJtzpPVrXijHkKdy2abs0ij1PwP+3G62jcw0+e3vk6yJbqWCmVez17ZwQiTrevgAyg999WJYYDCSJg0KEvq/WFSBcMTpVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G0B8Wz8G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMgDJKxE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G0B8Wz8G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FMgDJKxE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G0B8Wz8G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMgDJKxE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G0B8Wz8G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FMgDJKxE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B86822214F;
	Mon, 20 May 2024 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716200936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0RA57bLJgizJnhmxHZoqi/3xZ5ONH7xInPspR/5WeA=;
	b=G0B8Wz8G3TqgcNmLjzCMKZioEPsThtvgniL5kOCsHah3qdzzAZsh6IYUa2GbYAY/X2qs+I
	Oc6hwsnAhcKOew4GMJ6QregQ63EAizZlmCAWBOxivfh3rqKihw8mQP9jVMFrEcsYlIosNR
	/uuDOFoBatUkA4vINbJecqjeXHjpoRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716200936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0RA57bLJgizJnhmxHZoqi/3xZ5ONH7xInPspR/5WeA=;
	b=FMgDJKxEja+OOZ0g2RL7XtgCZQF9bclHtjTJhZuh5IyW60dDzZpVI5xb6BTbV6yz8Csan6
	lcH8amEtGSk7KhBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G0B8Wz8G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FMgDJKxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716200936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0RA57bLJgizJnhmxHZoqi/3xZ5ONH7xInPspR/5WeA=;
	b=G0B8Wz8G3TqgcNmLjzCMKZioEPsThtvgniL5kOCsHah3qdzzAZsh6IYUa2GbYAY/X2qs+I
	Oc6hwsnAhcKOew4GMJ6QregQ63EAizZlmCAWBOxivfh3rqKihw8mQP9jVMFrEcsYlIosNR
	/uuDOFoBatUkA4vINbJecqjeXHjpoRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716200936;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a0RA57bLJgizJnhmxHZoqi/3xZ5ONH7xInPspR/5WeA=;
	b=FMgDJKxEja+OOZ0g2RL7XtgCZQF9bclHtjTJhZuh5IyW60dDzZpVI5xb6BTbV6yz8Csan6
	lcH8amEtGSk7KhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83F3D13A21;
	Mon, 20 May 2024 10:28:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ISH9HuglS2bzTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 May 2024 10:28:56 +0000
Date: Mon, 20 May 2024 12:29:15 +0200
Message-ID: <87bk503hfo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: frank.li@nxp.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when remove module snd-usb-audio
In-Reply-To: <20240520170349.2417900-1-xu.yang_2@nxp.com>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B86822214F
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.51

On Mon, 20 May 2024 19:03:49 +0200,
Xu Yang wrote:
> 
> When remove module snd-usb-audio, snd_card_free_when_closed() will not
> release the card resource if the card_dev refcount > 0 and
> usb_audio_disconnect() will return directly, finally kernel will release
> the module resource. Then if the userspace continue to cleanup sound card
> resources, such as close controlC0, the closing path will touch this
> modules' code, unfortunately it just got released and the kernel will
> dump below error:
> 
> [  183.450073] Internal error: Oops: 0000000086000007 [#1] PREEMPT SMP
> [  183.456345] Modules linked in: snd_usbmidi_lib snd_hwdep [last unloaded: snd_usb_audio]
> [  183.464373] CPU: 0 PID: 537 Comm: wireplumber Not tainted 6.6.23-06215-gc5317d88b3ec #708
> [  183.472552] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> [  183.478039] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  183.485004] pc : 0xffff80007c19a3b0
> [  183.488507] lr : snd_pcm_dev_free+0x3c/0x70
> [  183.492708] sp : ffff800085c77af0
> [  183.496030] x29: ffff800085c77af0 x28: dead000000000122 x27: ffff0000079f8090
> [  183.503188] x26: ffff0000079f8090 x25: ffff00000e78c270 x24: ffff00000e78c000
> [  183.510336] x23: ffff00000e78c1a8 x22: ffff00000e78c000 x21: ffff00000b6a2718
> [  183.517486] x20: ffff800082608180 x19: ffff00000d2d7400 x18: 0000000000000000
> [  183.524635] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffa0000b90
> [  183.531786] x14: 0000000000000000 x13: 0000000000000000 x12: ffff700010b8ef49
> [  183.538939] x11: 1ffff00010b8ef48 x10: ffff700010b8ef48 x9 : 0000000000000000
> [  183.546086] x8 : ffff800085c77a50 x7 : ffff00006ccd77b0 x6 : 0000000000000003
> [  183.553236] x5 : 00000000000000c0 x4 : ffff00000ea57000 x3 : dfff800000000000
> [  183.560386] x2 : 0000000000000007 x1 : ffff80007c19a3b0 x0 : ffff00000d2d7400
> [  183.567539] Call trace:
> [  183.569992]  0xffff80007c19a3b0
> [  183.573134]  __snd_device_free+0x94/0x16c
> [  183.577156]  snd_device_free_all+0x70/0xe8
> [  183.581258]  release_card_device+0x30/0xc0
> [  183.585363]  device_release+0x50/0x10c
> [  183.589124]  kobject_put+0xe0/0x184
> [  183.592634]  put_device+0x14/0x24
> [  183.595954]  snd_card_file_remove+0x158/0x22c
> [  183.600322]  snd_ctl_release+0x174/0x194
> [  183.604256]  snd_disconnect_release+0x128/0x178
> [  183.608798]  __fput+0x160/0x3d0
> [  183.611955]  __fput_sync+0x74/0x84
> [  183.615370]  __arm64_sys_close+0x4c/0x8c
> [  183.619302]  invoke_syscall+0x60/0x184
> [  183.623072]  el0_svc_common.constprop.0+0x114/0x13c
> [  183.627960]  do_el0_svc+0x30/0x40
> [  183.631288]  el0_svc+0x38/0x70
> [  183.634356]  el0t_64_sync_handler+0x120/0x12c
> [  183.638724]  el0t_64_sync+0x190/0x194
> [  183.642403] Code: ???????? ???????? ???????? ???????? (????????)
> [  183.648497] ---[ end trace 0000000000000000 ]---
> 
> To fix the issue, use snd_card_free() to release all resources (including
> all files attached to the card_dev) instead snd_card_free_when_closed().
> Then, even the userspace trying to cleanup the resources, kernel will not
> touch the released code memory.

Hm, it's an interesting report.  Could you verify whether it's really
hitting a module unload race?  The module refcount should have been
non-zero when the device is still in use, and it should have prevented
the module unloading.

Practically seen, replacing snd_card_free_when_closed() with
snd_card_free() shouldn't be a big problem, and it'll work in most
cases.  But there are always some corner cases that might lead to
unexpected behavior.  So, let's try to analyze more exactly what's
happening there at first.


thanks,

Takashi

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  sound/usb/card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 1b2edc0fd2e9..5e799f147eb5 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -992,7 +992,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>  	if (chip->num_interfaces <= 0) {
>  		usb_chip[chip->index] = NULL;
>  		mutex_unlock(&register_mutex);
> -		snd_card_free_when_closed(card);
> +		snd_card_free(card);
>  	} else {
>  		mutex_unlock(&register_mutex);
>  	}
> -- 
> 2.34.1
> 
