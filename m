Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99F78C79
	for <imx@lists.linux.dev>; Wed, 22 May 2024 06:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716358870; cv=none; b=FUf+0IR2d5XZGMX//mTAlyb1OhHtN8s46KYU+22ZCBoDtNybecVLgQ/UOgFNQG4NQAKRy0phZ6P5AHKMv9cxkyHyMIXIoC4VlyG2VSu6B9IOpNgYHAApCrJEyRet9tnpZgLrH3kOFZL9idiPj7R5niMin1A2cfim4IET04xglJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716358870; c=relaxed/simple;
	bh=pY1dsy0V7Z5LoPuRfhzox6mxIPOWc1NekI+CzHadZsg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nger3FFLQQ/OqOiE3nfbPPcHPwz7qb7f+znrZ6OjolWYjy/0ktxObAWyyIQgO7/R/1Y7ISrS8G0DKhmxz9Lk/yz49CT4FliiPO2oyHYWIj2R8mq9AA+UpP/C3fnXZDnS5az7bzggacFdOL3c1pMlwoDn6eMzIjUnhqCB/D97DgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHpvDxSj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=usWTkN7P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JHpvDxSj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=usWTkN7P; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHpvDxSj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="usWTkN7P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JHpvDxSj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="usWTkN7P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 53EA334B9A;
	Wed, 22 May 2024 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716358865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvGwpIE6BeVXm/u85yzpmnhuLDEoM02YtbquVf9mSXg=;
	b=JHpvDxSjPNlYrhwLkSKBeH+n6F2Ad2OolFCFDRbqlxojQTcM5Mn6jqZjgO4ukLgU9ClYCa
	AKVI/eN4avFHYeWxHYhKbc3bGo8Cr1XkqqG0X3M1sxPj7Rd5xNYG2+LKFHKMq1WC2yVEjA
	V9CviYdQVrvGhoBTJrHdMVbndXh/x0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716358865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvGwpIE6BeVXm/u85yzpmnhuLDEoM02YtbquVf9mSXg=;
	b=usWTkN7PKOy5fVAFwK8l6ZCBcGnvf11e8cWe47XcDZmQ53Y0BA6G/GDIpckEaMR3EKVi8+
	Maybxj+lPUdQxyDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JHpvDxSj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=usWTkN7P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716358865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvGwpIE6BeVXm/u85yzpmnhuLDEoM02YtbquVf9mSXg=;
	b=JHpvDxSjPNlYrhwLkSKBeH+n6F2Ad2OolFCFDRbqlxojQTcM5Mn6jqZjgO4ukLgU9ClYCa
	AKVI/eN4avFHYeWxHYhKbc3bGo8Cr1XkqqG0X3M1sxPj7Rd5xNYG2+LKFHKMq1WC2yVEjA
	V9CviYdQVrvGhoBTJrHdMVbndXh/x0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716358865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvGwpIE6BeVXm/u85yzpmnhuLDEoM02YtbquVf9mSXg=;
	b=usWTkN7PKOy5fVAFwK8l6ZCBcGnvf11e8cWe47XcDZmQ53Y0BA6G/GDIpckEaMR3EKVi8+
	Maybxj+lPUdQxyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27FC813A1E;
	Wed, 22 May 2024 06:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wGOLCNGOTWa6YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 May 2024 06:21:05 +0000
Date: Wed, 22 May 2024 08:21:24 +0200
Message-ID: <87h6eqz7rv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when remove module snd-usb-audioy
In-Reply-To: <87jzjmz8vv.wl-tiwai@suse.de>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
	<87bk503hfo.wl-tiwai@suse.de>
	<20240521105605.xcnji3d2wcihekhb@hippo>
	<87le431ju2.wl-tiwai@suse.de>
	<20240522033425.yztpigsv3uhdl5zv@hippo>
	<87jzjmz8vv.wl-tiwai@suse.de>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 53EA334B9A
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.51

On Wed, 22 May 2024 07:57:24 +0200,
Takashi Iwai wrote:
> 
> On Wed, 22 May 2024 05:34:25 +0200,
> Xu Yang wrote:
> > 
> > On Tue, May 21, 2024 at 01:32:37PM +0200, Takashi Iwai wrote:
> > > On Tue, 21 May 2024 12:56:05 +0200,
> > > Xu Yang wrote:
> > > > 
> > > > On Mon, May 20, 2024 at 12:29:15PM +0200, Takashi Iwai wrote:
> > > > > On Mon, 20 May 2024 19:03:49 +0200,
> > > > > Xu Yang wrote:
> > > > > > 
> > > > > > When remove module snd-usb-audio, snd_card_free_when_closed() will not
> > > > > > release the card resource if the card_dev refcount > 0 and
> > > > 
> > > > [...]
> > > > 
> > > > > > Then, even the userspace trying to cleanup the resources, kernel will not
> > > > > > touch the released code memory.
> > > > > 
> > > > > Hm, it's an interesting report.  Could you verify whether it's really
> > > > > hitting a module unload race?  The module refcount should have been
> > > > > non-zero when the device is still in use, and it should have prevented
> > > > > the module unloading.
> > > > 
> > > > Yes, the race does exist. I enable trace and got below output:
> > > > It seems that snd_usb_audio module refcnt is 0 after insmod completed. So
> > > > it can continue to be removed even it's still in use.
> > > 
> > > If no device is opened, it's not really "used", and the driver module
> > > can be unloaded at any time.  That's the intended behavior.
> > 
> > Hh, I see wireplumber did open the card_dev when it scan card devices.
> > But wireplumber didn't close the card_dev when the scan process completed.
> 
> Then rmmod shouldn't have been allowed, it's a consequence of the NULL
> module pointer, I suppose.
> 
> > > (snip)
> > > > Then I take some time to check why snd_usb_audio module refcnt is 0
> > > > even though the card_dev is in use. Finally I got below finding:
> > > > 
> > > > I build kernel and module with below configuration:
> > > > 
> > > > CONFIG_SOUND=y
> > > > CONFIG_SND=y
> > > > CONFIG_SND_USB=y
> > > > CONFIG_SND_USB_AUDIO=m
> > > > 
> > > > Then GCC will add -DMODULE when build snd-usb-audio as module, but will
> > > > not add -DMODULE when build sound/core/*.c.
> > > > 
> > > > When insmod snd-usb-audio.ko, it will create a snd card device and call:
> > > > 
> > > > snd_card_init()  // sound/core/init.c
> > > > 
> > > >   #ifdef MODULE
> > > >     WARN_ON(!module);
> > > >     card->module = module;
> > > >   #endif
> > > > 
> > > > However, MODULE is not defined for sound/core/init.c, then card->module
> > > > will keep NULL pointer. With this results, snd-usb-audio module refcnt
> > > > will not be a non-zero value.
> > > 
> > > Ah, it's a good finding!  That explains.
> > > 
> > > > > Practically seen, replacing snd_card_free_when_closed() with
> > > > > snd_card_free() shouldn't be a big problem, and it'll work in most
> > > > > cases.  But there are always some corner cases that might lead to
> > > > > unexpected behavior.  So, let's try to analyze more exactly what's
> > > > > happening there at first.
> > > > 
> > > > With above finding, we needn't to replace snd_card_free_when_closed()
> > > > with snd_card_free(). We need to find a way to correctly handle module
> > > > refcnt since this should be a normal usecase.
> > > 
> > > Right, I guess a simple fix below to replace '#ifdef MODULE' with
> > > '#ifdef CONFIG_MODULES' should work instead?
> > 
> > Yeah, it works for me.
> > Will you send a fix for the issue or suggest me send it? ^_^
> 
> I'm going to submit a proper fix patch later.

Looking at the git log again, I noticed that it's rather a regression
in commit 81033c6b584b.  So at best we should address only this
regression by the patch below.  Then the rest '#ifdef MODULE' can be
replaced with '#ifdef CONFIG_MODULES' in another patch as a different
fix / cleanup.  The latter changes the behavior slightly (now the proc
entry appears even if you build the sound core into kernel).


Takashi

-- 8< --
Subject: [PATCH] ALSA: core: Fix NULL module pointer assignment at card init

The commit 81033c6b584b ("ALSA: core: Warn on empty module")
introduced a WARN_ON() for a NULL module pointer passed at snd_card
object creation, and it also wraps the code around it with '#ifdef
MODULE'.  This works in most cases, but the devils are always in
details.  "MODULE" is defined when the target code (i.e. the sound
core) is built as a module; but this doesn't mean that the caller is
also built-in or not.  Namely, when only the sound core is built-in
(CONFIG_SND=y) while the driver is a module
(e.g. CONFIG_SND_USB_AUDIO=m), the passed module pointer is ignored
even if it's non-NULL and NULL is kept in card->module as consequence.
This resulted in the missing module reference up/down at the device
open/close, leading to a race with the code execution after the module
removal.

For addressing the bug, move the assignment of card->module again out
of ifdef.  The WARN_ON() is still wrapped with ifdef, because the
module can be really NULL when all sound drivers are built-in.

Note that a NULL module pointer won't caught by ifdef MODULE, but it's
only for special kconfigs and this warning is only for debugging,
hence it shouldn't be any serious problem.

Fixes: 81033c6b584b ("ALSA: core: Warn on empty module")
Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/r/20240520170349.2417900-1-xu.yang_2@nxp.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 6b127864a1a3..ac072614d1ea 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -313,8 +313,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	card->number = idx;
 #ifdef MODULE
 	WARN_ON(!module);
-	card->module = module;
 #endif
+	card->module = module;
 	INIT_LIST_HEAD(&card->devices);
 	init_rwsem(&card->controls_rwsem);
 	rwlock_init(&card->ctl_files_rwlock);
-- 
2.43.0

