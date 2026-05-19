Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140303B19DC
	for <imx@lists.linux.dev>; Tue, 19 May 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174547; cv=none; b=CTLRuEegAFz95vFnR1CQQOE7ubwNnvVUgLSXiYcktxeYRYKDIEbCd0mVg/0Nalt+SBk+Ro1vR2kPVvd/b57wbGGUMVc+BTpeNjZZ9HOXEws9V2vx2l/D6pFBLBIP5tFnhHM+jzIjpLG2+XTVtStODJl02Kqm0Cf9dtWjFrpKWRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174547; c=relaxed/simple;
	bh=ImIuCAcIqyqmBNWHBa3iu6wn7MLrAlHo7NfzYiVsx7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3Vjvbe+Aljm6T2BnLZdsNyT0HwfsHjqN0HFNiskQWVbidBeyhMkzQDXkjRAyQkJhl6p9AAdCWbPNVzCLBlQYqASKspu9OWTwKA74sQNAFTOpVBoFi84HeVWDNUkgIlCBXuxJc0LyT3gxc5ap2/v7zlDqnEmjAm+CB6qtWz0xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S07rSsjA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S07rSsjA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so46654255e9.2
        for <imx@lists.linux.dev>; Tue, 19 May 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779174544; x=1779779344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6a2r8a0BWvk68vyPMWjRdbCGVjXTo9hI370AIbfJYM=;
        b=S07rSsjA6l8eTDs5qJ1J46HeNoFBdSVMHxzy/jdERWJX78Za4KEAHaQeSDcpDyAtm0
         vn3qv+vMXEE7nsqqVCHlBUKDoyfqy8tqLUavYRS5RjU76uHv4+n5Sxj5Lomi+KBEtXM1
         zPZDxSw5DzoJfQZl4qGmWAwrx0Hh4LHpU8GC8fzQ8sImZ2Yp/40CYqGTXdgvfenUJRzY
         rGNTwHzLzHe8B+3GF8kZlg8E4K/le5oaD5on24rGsh/kImemV4eOQ/FGjvaiBSz3uJUo
         KFWDgVrBrljXQqzG2QcrI31OJIEgGymHpTOtouArYbOg6cea3nBW2oIRcHxSpWBa4Qkl
         /FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174544; x=1779779344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6a2r8a0BWvk68vyPMWjRdbCGVjXTo9hI370AIbfJYM=;
        b=l6wYmgznkk++G5mtrt5zxzG/US4QoGuSKQsBkWNSnkf5R1qxUgIyOPdvU38g7q74/4
         eCMdKumDn0JmMsYYlDyRn2uPOj25oV3KdXZzSbunQoiNgllayF6vGtLaOK3E+uo1XoVd
         jkoo5zyesv+dk703RfRHA3zzlAv47PRX5JuQOUu8OgtUG8Mt/VdkizNENNgATJWMG0M+
         +EwvbalO9jMtnuadkGdDZApDs42RCOBeIVwLeED/c58Vt4ePeJafot4SM94VJINm6yFJ
         4wq7bQ2LVc1Hk1EY8AxZbaFsl3KpD1/dKyuK9X1V1y0jWrHU7BDD3rWwzIE66DDsJ2gv
         KqCA==
X-Forwarded-Encrypted: i=1; AFNElJ+VlBn+7at5deYsxjVHMqmWwhOtEyoVeh72me73CtdC/Owcs0rD3hH9YGt6yWxmmE4+zus=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3YxMVria/Zv06SHhsDlJA5uawePd9FIW6QxVJcarAIfozKpfZ
	mLZbTjaMR1furcDVot04jGrXbHMuQcWBnd12itt4v7/00SiHyhoyqadY
X-Gm-Gg: Acq92OEpmo2QvGk21jvsg/pBIti184B7IAVaSeHXIg+7XN1ewycNmLGXSYKwSa8M30C
	bSFo2NzbO0TxYgmTySeTMrYNN6JXge33SXpqtR0HXR/WorLEXfc07TqF//i0tzbzyRTuKKbyrEX
	EfCQjMUW8heb2CfxjdSdp2SeiiQZxyNjmx263wKP9+Gb1ghdxuvhMhqFjkqvwZSSGHWkU5QXhG9
	fzi4w0zHGHavV/BU7QoqW/5elxfkj7pjERfal+iakJayOhYDoACbJ/coiT8ICrKhPDgjKBQomUE
	FNJMmDWl8hLFLrupSxoAHXH6C5LXSDJJBlnUMYphG2ECP5shSlim+D12d/NucyOFHR/cIP98j7+
	cBGjM40zgkwnEyd6BNnPTPc9gAYl5ESg2JK3REZfFHJSHd2aTDxFPxGNgp6i4EN/y1IWBBXJeQ1
	higoI9m2yYgCuVe5nDmTzyB1X/mLFVmYBQBg==
X-Received: by 2002:a05:600c:3487:b0:48e:7f22:d90 with SMTP id 5b1f17b1804b1-49017d45a80mr77427095e9.4.1779174544309;
        Tue, 19 May 2026 00:09:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe83ba2sm98359475e9.35.2026.05.19.00.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:09:03 -0700 (PDT)
Date: Tue, 19 May 2026 10:09:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Message-ID: <agwMjD3sjAaSMIuw@stanley.mountain>
References: <agv_jhP-2CNTfQXk@stanley.mountain>
 <20260519064057.31E09C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519064057.31E09C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 06:40:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [Critical] Unlocking `dev_ctx->fops_lock` after `dev_ctx` has been freed in `se_if_fops_close`.

That's true.  There is a use after free in se_if_fops_close().  Someone
else care to fix this?

> - [Critical] Invalid `kfree()` of an error pointer initialized from `memdup_user()` causes a kernel panic.

The way I remember it, I'm the person who said that __cleanup code
needs to handle error pointers and so for as I can see it still does.

> - [Critical] Direct dereference of a user-space pointer without `copy_from_user()` in `se_chk_tx_msg_hdr()`.

Heh.  Sashiko is smoking crack.

> - [High] Concurrent modifications to the global shared list `priv->dev_ctx_list` leading to memory corruption.
> - [High] Concurrent access to shared `cmd_receiver_clbk_hdl` state in `se_ioctl` causes a memory leak and state corruption.
> - [High] The `.release` file operation uses an interruptible mutex lock, permanently leaking resources if interrupted.
> --

regards,
dan carpenter

