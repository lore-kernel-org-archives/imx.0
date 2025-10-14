Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32C31352D
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444550; cv=none; b=I27X0hlaMVfdupSWfiHEUh++1ZQUAS8wZuG2oj2YMZRIc1Vp3q/JZuqF3Ac0AGXQDjdJBK7NKL6LvJ/FpHN2ku5w7wH0fGrO0rHQvBGz17KLqc6RO+micBBff2W4a0kArc435exWSzxbAGbdw8iAD8ZqwauzT36K796aGSOBmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444550; c=relaxed/simple;
	bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENHxAcA55B8RAk0Vd5jyWESB7tn4/EDiIg/c2GmymSghJ1XcM0S2KyoSqJiimQdhYY14ETVtONz5+Vf2xtm6/pAtDqkI/nVWqlk3jpr9koZUOd0WbYZ1YJimwDeB+DRr1uwa2JECvWOMCOVR0JbBtrcL0c7ycnK4myuTB/bcVhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNJ/O1iS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNJ/O1iS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so1938593a12.3
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760444547; x=1761049347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
        b=HNJ/O1iSsWwbm8KVtKMfqfnjYp4j7iIONpiaiD8amrl2AAi/0NgLnujcCtW609BbaX
         FZDTTD0P4hu3lZZevPIVZ1XN5ovU43b2BA0NU03RuTpTkT+7voz6Z715OzS3+S9nKonW
         I13RPaGmCJNZsOPh77F+0fFe3s6yV5jbF/U1USYkVsxMluLNnCj/AQ9/L18PMs3dHikx
         Gc1SnaRURqUZabQLvF8/cxfNpmJl/UmZXZF3TgIAyycBA5oLiaZnvKgIs4BlLjGWQ8Lc
         SqAsgFTfkVzLAAvTs7K4zUSmh2lTQWOL8Sds4/OAcu61IHRFLnr80H+pOICWCGbze0Qu
         rqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760444547; x=1761049347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
        b=PKT2MQVBziUpH7YIZLLTP027FP4pO18xAbqfdlq306OIyCZCHsjlNw7FbG2eJlIO+v
         yWAu06FZS4Sa3doquzYLivVc2xK9RxKawmP20HHidKz6tHKxymXgcw90506x2idoCKon
         aYNd3Oabcuz+XjblDggPLNFoMmJdqjYNA7QPoQpu53dZUPA1Xg/JSUXiLvKi7GaHDNgU
         cMlyyei0ezKlnNtzJ415dIZMaGp0nUiDBjEYIuyaWcCeAgCiP8BXzaVebcZCprygC8xA
         cqiqk9maIg87aNX7RD4NbHWO71Y4AaCewIinOygAviUPspaVf9PpM3d+hot/O04HHDTx
         rkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1wzTLTghkhfdyY8wgKwvXWYHKE/aS/9V4a3/nawPFCt8Bt/c0570SKZn56FD4vSlKVxM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwEH05PLLEKmNNhkgzGSTcD+IPaOeJbP2BqsEU+IwQZZiunflF
	pNsxYJF+wdeu10wjJGVxMt4TmdyyUyJdGYiiGyhXYIPHh5UilVjfrgU4
X-Gm-Gg: ASbGncuG8mGkLsxJHuw8Bavm9kXKQd/2vyrtgZ+kFTcuap9Wy1xVFXcRFbJh6xONNH1
	cPjGRlQhkLvBHa9+VfMf7BeSsZxSdTT8U6Lgx11vXjJemTSj6xMNeVcfGtjtyZOphP8Fm8jmlpd
	br0I/sievV5sOXBFgbq6jA8bCWWZotnOVhzaX6aO3pmWdoXykOrQKOVJTZXBXD0lUmcBxB4AOlm
	hKxv6jsKuDMpjdmCn5KCPgokl8Itc/FWWteaL6FoBMjUD2G9+Wu0S8EvYBnYOJPteKOiss5uWqU
	QUOSMrpsAMAnxCSx4tMyA0P7Ed5jO199BZRO1/erHI6x45X0cpVTp3Wq2bd20J5tAC9XaOxt2Nd
	IPfSKUNfSni2mvnQyYEXycYhgXB5bIGWkWYEm33xLstDciEancsUKV+f0S8A8bJXdn4vK4pmjzu
	rL0pG9INd7Qw0Cod+RRLAHInRUAVXgDLk6Qh9UCXO7/2SyelKsj64=
X-Google-Smtp-Source: AGHT+IEj2JtS1ykV7+4SnCPxXcV5s4F2p8zZ4Ybts8U4kG/OqGnxgxiwp/Y8Fv2A2MsHbr+lECLEwQ==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr22376195a12.13.1760444547186;
        Tue, 14 Oct 2025 05:22:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm10963835a12.10.2025.10.14.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:22:26 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:22:25 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <tguubjlh7ta7rvaq5pzzksamnc2kxy6yunsk3jeiiqz55on4yo@outv5vc3b2vl>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
 <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
 <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>

On Tue, Oct 14, 2025 at 01:43:21PM +0200, Luca Ceresoli wrote:
> Alright. Let me know whether the series I've sent fixes 0, 1 or both
> warnings.

Hi Luca,

Just replying to have the info in this thread as well, the series fixed
all warnings I saw, thanks!

Kind regards,
Ernest
