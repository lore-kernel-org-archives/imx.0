Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0A752F74
	for <imx@lists.linux.dev>; Tue, 21 May 2024 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716291142; cv=none; b=pOhppgJxV/Om0zUJj1l/XQMSbkRGR4wtYcETQY7cQoFse91i7I2Wca0UoeSXolOoGQouxfrBBE4FbqpqxzFZFcyuLTopM/0F/3bIBcGGSASQNwq8AOrjhweAQprlt0BrDyzfkSD2rUI2K8pGU9sElf7AaTKRmzw+ogFthgUhcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716291142; c=relaxed/simple;
	bh=WVHUNvt2n05jMtyjkpJQIA+KOShsXdU5r1LBsnH1fS0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tW8x6huAzPnNFOJOIupseVhWNEK1IirpPpi87lQHMwUjW8IuXAiqtxL+Goq4JrEa9sNMeAn8LSeCY/q2bJMZmepOV42R0vmDflpiqyWDMHFUHnctT+AYJ60a1w1KIAaK3UNuRZrAFB4oVjDH9KNzusjz394bAmcNQkYtzUYOS3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cg/qRWct; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F6YjJlRz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cg/qRWct; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F6YjJlRz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cg/qRWct";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F6YjJlRz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cg/qRWct";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F6YjJlRz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DF785C0BA;
	Tue, 21 May 2024 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716291138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GP+5xwAxBdRf3csgLvTwiz6w2UGzt5EpoCNCaRkTqoE=;
	b=Cg/qRWctyF22Gyhqpb82FojzY/z6U7jvysOymhlprFggOANXrc9mQ65ULKI1SO5bzr8fIS
	axPJIpqYcbRoRhxc8dInSWuC32V4RnlG0ASH5kglutljXBpO2wSnYa2uvUm1+IXQtyrkWk
	7ar4xuw2KXQ3ejY64GngWWb/tQmkKKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716291138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GP+5xwAxBdRf3csgLvTwiz6w2UGzt5EpoCNCaRkTqoE=;
	b=F6YjJlRzRQwBkoCA/lfif7qiv1I253JU6nWimvn+kjmIAOzQdbxqQT6JNbi85UuO9GZTKu
	WBzT8I/fL603sIDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716291138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GP+5xwAxBdRf3csgLvTwiz6w2UGzt5EpoCNCaRkTqoE=;
	b=Cg/qRWctyF22Gyhqpb82FojzY/z6U7jvysOymhlprFggOANXrc9mQ65ULKI1SO5bzr8fIS
	axPJIpqYcbRoRhxc8dInSWuC32V4RnlG0ASH5kglutljXBpO2wSnYa2uvUm1+IXQtyrkWk
	7ar4xuw2KXQ3ejY64GngWWb/tQmkKKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716291138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GP+5xwAxBdRf3csgLvTwiz6w2UGzt5EpoCNCaRkTqoE=;
	b=F6YjJlRzRQwBkoCA/lfif7qiv1I253JU6nWimvn+kjmIAOzQdbxqQT6JNbi85UuO9GZTKu
	WBzT8I/fL603sIDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C89213A1E;
	Tue, 21 May 2024 11:32:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4UVfDUKGTGZrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 May 2024 11:32:18 +0000
Date: Tue, 21 May 2024 13:32:37 +0200
Message-ID: <87le431ju2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ALSA: usb-audio: fix potential use after free issue when remove module snd-usb-audio
In-Reply-To: <20240521105605.xcnji3d2wcihekhb@hippo>
References: <20240520170349.2417900-1-xu.yang_2@nxp.com>
	<87bk503hfo.wl-tiwai@suse.de>
	<20240521105605.xcnji3d2wcihekhb@hippo>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Tue, 21 May 2024 12:56:05 +0200,
Xu Yang wrote:
> 
> On Mon, May 20, 2024 at 12:29:15PM +0200, Takashi Iwai wrote:
> > On Mon, 20 May 2024 19:03:49 +0200,
> > Xu Yang wrote:
> > > 
> > > When remove module snd-usb-audio, snd_card_free_when_closed() will not
> > > release the card resource if the card_dev refcount > 0 and
> 
> [...]
> 
> > > Then, even the userspace trying to cleanup the resources, kernel will not
> > > touch the released code memory.
> > 
> > Hm, it's an interesting report.  Could you verify whether it's really
> > hitting a module unload race?  The module refcount should have been
> > non-zero when the device is still in use, and it should have prevented
> > the module unloading.
> 
> Yes, the race does exist. I enable trace and got below output:
> It seems that snd_usb_audio module refcnt is 0 after insmod completed. So
> it can continue to be removed even it's still in use.

If no device is opened, it's not really "used", and the driver module
can be unloaded at any time.  That's the intended behavior.

(snip)
> Then I take some time to check why snd_usb_audio module refcnt is 0
> even though the card_dev is in use. Finally I got below finding:
> 
> I build kernel and module with below configuration:
> 
> CONFIG_SOUND=y
> CONFIG_SND=y
> CONFIG_SND_USB=y
> CONFIG_SND_USB_AUDIO=m
> 
> Then GCC will add -DMODULE when build snd-usb-audio as module, but will
> not add -DMODULE when build sound/core/*.c.
> 
> When insmod snd-usb-audio.ko, it will create a snd card device and call:
> 
> snd_card_init()  // sound/core/init.c
> 
>   #ifdef MODULE
>     WARN_ON(!module);
>     card->module = module;
>   #endif
> 
> However, MODULE is not defined for sound/core/init.c, then card->module
> will keep NULL pointer. With this results, snd-usb-audio module refcnt
> will not be a non-zero value.

Ah, it's a good finding!  That explains.

> > Practically seen, replacing snd_card_free_when_closed() with
> > snd_card_free() shouldn't be a big problem, and it'll work in most
> > cases.  But there are always some corner cases that might lead to
> > unexpected behavior.  So, let's try to analyze more exactly what's
> > happening there at first.
> 
> With above finding, we needn't to replace snd_card_free_when_closed()
> with snd_card_free(). We need to find a way to correctly handle module
> refcnt since this should be a normal usecase.

Right, I guess a simple fix below to replace '#ifdef MODULE' with
'#ifdef CONFIG_MODULES' should work instead?


thanks,

Takashi

-- 8< --
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -50,7 +50,7 @@ MODULE_PARM_DESC(slots, "Module names assigned to the slots.");
 static int module_slot_match(struct module *module, int idx)
 {
 	int match = 1;
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 	const char *s1, *s2;
 
 	if (!module || !*module->name || !slots[idx])
@@ -77,7 +77,7 @@ static int module_slot_match(struct module *module, int idx)
 		if (!c1)
 			break;
 	}
-#endif /* MODULE */
+#endif /* CONFIG_MODULES */
 	return match;
 }
 
@@ -311,7 +311,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	}
 	card->dev = parent;
 	card->number = idx;
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 	WARN_ON(!module);
 	card->module = module;
 #endif
@@ -969,7 +969,7 @@ void snd_card_info_read_oss(struct snd_info_buffer *buffer)
 
 #endif
 
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 static void snd_card_module_info_read(struct snd_info_entry *entry,
 				      struct snd_info_buffer *buffer)
 {
@@ -997,7 +997,7 @@ int __init snd_card_info_init(void)
 	if (snd_info_register(entry) < 0)
 		return -ENOMEM; /* freed in error path */
 
-#ifdef MODULE
+#ifdef CONFIG_MODULES
 	entry = snd_info_create_module_entry(THIS_MODULE, "modules", NULL);
 	if (!entry)
 		return -ENOMEM;
