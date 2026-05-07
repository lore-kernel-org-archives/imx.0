Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9DD33711D
	for <imx@lists.linux.dev>; Thu,  7 May 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135728; cv=none; b=Vup7DBKvTSLp2y+5qhn/0TSWQPPDTtQfA+VqYu/96QydBrGrxUxkYqXpGCffWEHAzesyOitCH8hj9dgttVksJ52QvPALpTE+aFuarVzlxk2UvMk+RqpxKEFQfMStxRhOn8qVj7QwfUWFtmeMSSXUNpluh94b46AGijZzXLbBq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135728; c=relaxed/simple;
	bh=JURCFEtliaIRpN9Cos7/h6lHIssSOaY90c+WmkGb0BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGrVEYdZeon0UWryVxwdBLb/KYZiUqIK8qnfD9OHA6o7jaNGjsua1sUaa0/DQX/H2u4yeWXKCg1OXcVlqsWUMlprG8Y1oxOGewiaYjn2W983j34/pL/nRkvnScoW+I/oqAUG4tM8TTU2g5CLVJknYBGVCCzSLWpHlkoiS4R4t+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzdQvpiG; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzdQvpiG"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dcd689829eso468295a34.3
        for <imx@lists.linux.dev>; Wed, 06 May 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778135726; x=1778740526; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIRp017Cf71rMxx3VTyJI1fcnUqZZinyDZQJL0+xtC8=;
        b=qzdQvpiG9D/gHxm55DJY6riy9F26F58SrEBH7P6f/AHT4ijqJ3akbX15FlVw0ViIwb
         RS+u8LcwWx0F93WrxqK4G8c9WLALTiu/mEtAz5HLDuCTukgFts0HmrbkNnZkpuJCiU58
         7Eoudujf9kA+8fqkjCj9oKuYct5Wy40VJLKYtNXMiztd0zkMCvQmfHklqoHcQiwcbNna
         wFW2zzKQPG44qG3gc7ltPBeQOmWL8EItXrocWn3NJzyJUJOQ+qKXuZ904nvJ+bKPYAYM
         76PHsD06dmPzBjyyp7+7+cQOvBwGEFkqpTDesIMyJhB1oUOIf4gLym1kPBym29LILTvA
         WeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135726; x=1778740526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIRp017Cf71rMxx3VTyJI1fcnUqZZinyDZQJL0+xtC8=;
        b=T/HGhBYuFRuth67bNMNoUP3Pwf+7hxdYShcvobS+KVQXAL6rZ1/AKQm31C2zowA+v/
         eH+TPEZdUs5jwaYKRrxhgFs9cc9mbQPI+5vHmL08NA+C79QXs4Z0ZqAZaC1XDHjP2Bwy
         QH0UC78QgDC9nmMVQTgN5lQPx5HT4U4p8oEOdIjcmF7Havp+e8/sZu9D61qFrEzfazXJ
         SQt26JZ0FX0rfqM3QpC0zqeB16PfCYVb4zVfgFeiUBrenyuRSUO/gO5KARZssgYyc/Nq
         tpqY+abh/tBysOuaRRWJOmsNMhsT2uJ79dADg+uL4acKsV21HXd+nkvl/itP9xZLZ3Km
         r7Zg==
X-Gm-Message-State: AOJu0YwEFKKUpPL3MMlhs5WB3Z4dG98aAaooDg6JOnigsP+lglDYWowt
	F+/nN8oUwiKYk53HZ8Es1NgtJ4MtBGtP/eqT5A5jUeXbl5P5q0pMhi2P
X-Gm-Gg: AeBDiesc3h/ae5m/sJmAgkvtBeJo6zB3zrRAMdXB7aC6fFWiXclACVW+m/KBTGZzVzg
	chdJIlYhPFWEpdw7daqfvSqe7D9U6q2hBxxZsXHaUURFEsMCllG4zdH3RSOTJjnLhNIQ1NMlLL4
	TdYbevMZi/ZoAdRd+M8KxOaVP+u7paf9WdrTceeTawCh/FnpGijC3Z+hYgg9iEM3Ullf4z+jWvi
	FvVQr1i2V5/Nj5sA6jo6tHWnY9M0kTs35oeWgt3NMIAh0pn4ptnWJc3Q+V5EaDSF6r/aOiPXWw7
	s5KaVQIp4rB/42pLw0Xc6W8kYXPLdLzr3X4otNnUf3uvE4EZxm9ksLN78JJyJ6QD42Gg5Kip6c0
	YkCJ8w0+q3XBSgW6kFpDH8Jr51nJTbKRt0KyWwI70spT+Qlnv/EUyEaHPAPktLOSgkCEa2Ok4yw
	2iw7PRWtDQPh9EysewZozl27qeuqZE
X-Received: by 2002:a05:6830:3907:b0:7dc:d2ad:fb29 with SMTP id 46e09a7af769-7e1df129abamr4053540a34.24.1778135726007;
        Wed, 06 May 2026 23:35:26 -0700 (PDT)
Received: from localhost ([206.212.255.76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca7f46e7sm14305940a34.8.2026.05.06.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:35:24 -0700 (PDT)
Date: Thu, 7 May 2026 09:35:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev
Subject: [bug report] firmware: drivers: imx: adds miscdev
Message-ID: <afwypVc5gq_QoF-h@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pankaj Gupta,

Commit 4de71839142b ("firmware: drivers: imx: adds miscdev") from Jan
22, 2026 (linux-next), leads to the following Smatch static checker
warning:

	drivers/firmware/imx/se_ctrl.c:490 init_device_context()
	warn: '&dev_ctx->link' not removed from list

drivers/firmware/imx/se_ctrl.c
    461 static int init_device_context(struct se_if_priv *priv, int ch_id,
    462                                struct se_if_device_ctx **new_dev_ctx)
    463 {
    464         struct se_if_device_ctx *dev_ctx;
    465         int ret = 0;
    466 
    467         dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
    468 
    469         if (!dev_ctx)
    470                 return -ENOMEM;
    471 
    472         dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
    473                                      get_se_if_name(priv->if_defs->se_if_type),
    474                                      ch_id);
    475         if (!dev_ctx->devname) {
    476                 kfree(dev_ctx);
    477                 return -ENOMEM;
    478         }
    479 
    480         mutex_init(&dev_ctx->fops_lock);
    481         dev_ctx->priv = priv;
    482         *new_dev_ctx = dev_ctx;
    483 
    484         list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This adds dev_ctx to the list

    485         priv->active_devctx_count++;
    486 
    487         ret = init_se_shared_mem(dev_ctx);
    488         if (ret < 0) {
    489                 kfree(dev_ctx->devname);
--> 490                 kfree(dev_ctx);

But it's still on the list when we free it so it leads to a use after
free.

    491                 *new_dev_ctx = NULL;
    492         }
    493 
    494         return ret;
    495 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
