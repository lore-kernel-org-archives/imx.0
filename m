Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992595;
	b=QirJhK4FNKl7CyDnaj0L7OCDMNutOKiXQ/4tMbcocOmLqPAuEXTIrSRMBLO+Hard46jL
	 hmZp2Ei8jALq3Y8eeG7OiYW/u3FvNfaY/ma/tQ5i0OKadUEn1sz8c2Zb9O12Lr5dBS31y
	 iNavhPkz9LnFrk2bsj5xCNJtIOGNGNZPfU4WVJr0HbGbgMYqmp8ExLN5uGTDTRWTNsdIa
	 Ui1TO4UPTRQuhCsuy9nlXQKKAppUYS1ZG7Ogk4K8eY2WCxic9QdCjYzLc5CW4j1kc6Bac
	 ElAl/1J4NLVuHj6/vX3ylFvxCsKQ0yWqd/lKYF82DTSOLABl+FizmuRsIoXyjTCtgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
	b=cXMi596rHY5/JBqcPGxNgxsr3dsG/dW4irhxDHqGuMQfOULQj0qQtyW3POBjUJVi7iVY
	 O9BKkJkl+ftDJ5h/M49sTVGF4FWlLU/oWLSSmQ5wldggLHwbAjjjKa1aOze0iv/WzLcy1
	 8g9pqIsVgsff3xRmHWHm6x5Gb51x7bvETlF51hIvPPEwdoLXrb5p2Z91rIAnwagRk4JOZ
	 FAiiKt3Zwiuck2bkWtg9gwMS3bSXfg5PB25TCIzOL/cwP14zvUhz4mWpDguRjKBvQOVYG
	 YnFBxXTwehQDfKTp29RckuzPv461b1HaEKT/de7lbgrM9qD5zWbGzf8NYFGimM4MVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8NWHG3O;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01486606A320
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 09:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01486606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8NWHG3O
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6664665e9.2
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992593; x=1795597393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=y8NWHG3OHQ2iTXwMG+8lQk6o5vMmArWIerKRH/sQSW0kUcGooZWzP/S01ejOhFdYYr
         +9qNt5+0Iyn0zdGqo54zy/yOXkGDq3u8u41nwjTph8WHC1/HRzyL0AaPuj6XKzzTafUm
         xGs0Uo2aUFbPluLcdFoUW2qtJ3HaPDgmm/qDhDMifAhbd3ExGrcFBotEmUz2baiojXit
         aVsi+db208FvAt4XlAa8qw9+tZr4HtSBzBVPnVUQgWChMwWA7vndqsQCB0An7MgW3rpc
         T9sNIzGImx0836s4n5hYRq2XYp4VRifSCqBIZrrNw9dCZ8TmNluSmak38Yp1oBjnvyse
         CFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992593; x=1795597393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=2lPfsr7uBP4T8em2rZWG9V8RoNlj+E9mVoY4SJ7RUuN+T6OXAWEVomVmGX3f8Pqwul
         DwnRYQ1oSv3Ll+vE4xjgt/tdCSMSEgHLseWKjXrRt7tZf0oKibFE9tdtlcwRu/s79XjB
         jNZB+s7Q7AojXhIX2qBPQneDjReSSgodxTfXS3Z2R2V8zQ+Lg1DS7KhGWvIhYOH3k9yb
         6OBFUR+AzTHHHtT8A4ZbCtPsS6KzTlaKwgC84RwicEbvkJulCqSBtJmMoL1v2uLPxHy6
         mbN+EBK8fHKGbne0LdZPOEfgqK9HY8xq4PvGnKD4MlGjH36CGvHcNFlY+WfFUsOJqm/l
         Eh2g==
X-Forwarded-Encrypted: i=1; AL+hErHalO+7WxFKGvaf9Buaa5SelBMX5PiSZyCbxg5kQBguIfw9LdHVw/BnIt1L0k04mziAyFM=@lists.linux.dev
X-Gm-Message-State: APuU4Z85Ye/RCNq96yH6C5A8fpZyoU26dSzcBb+SlFBSOkkI91LUGl1K
	Qn/4h0+0QDnA2LE4sP/83TjkI8bjyE1L5VhkYHx2bfb8nec5cyjCcKBW
X-Gm-Gg: AYBFou1Xt2GLNifUWnWNjcpAVH90P7p9d5P6hPz6LqBznzxZKJf7wUPScKsegHflfed
	exRBT5Hy+RTtgdpuppSNOZS4sYhUpOtwFlyjfy2JHOLzhwnHniDGTXJ8KJTk+gAOwGd/mp8IWTu
	KRPEHUK2n9KVaknvs4AEFzT9EhiKsMj8KFOx/5uvQk7D340NQlmOHkFOOC/bT3bsRamvmWj1NT9
	LJGNt+SqmnHPUVb4GigRTGK4Eotx2VrLWpwKN/p0ZyMrb++x6U+/Fzo57Bb6soUcq85/CQdycdX
	2QyN5idyQEgb5huEUkwwNgOuXjIXqoesOuulTJv+ZV2TMsYU+a+EF7wdIuADgB58wLHWbAOYvX5
	xWYWn+7L82j3bjaZV+nbrkNz+xje32P+t6N2PgiH9tc+1uOu7avg1kjyoPIUExVC+P68YsWVnB7
	+vQpfdLcmVKQdP8Sjlktgjbgw8M1jRKNjJK9RMHSfxlFPfzlsFgaCWFFjvstTtHJM81hD5hK1Yg
	NP9PHBSNzPg7gqI3ncC44E7xkuVVtUg/nyPOzcKDj72q9sTNZHdNWXD2QR8txsklQkdxxT42LKW
	jsZjJXTdLZSa4B46jQooAEQOVvCOQgTI6Ccn2bPjo+MSnmWV5W3qk5xbmY1Jm/PAIaek+0eVCSw
	mFzo7GGY74+m6P+QQ9nu22MPuU3YwAfUJiTGuuEtsgVDAJJ6eeU3fvuW9MECqbgp/0BPjaM+hZ8
	11DTrlU0BTs5Md
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb7da3ad9fmr32336225e9.28.1794992592998;
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm50596605e9.11.2026.11.18.01.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Date: Wed, 18 Nov 2026 12:03:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: slongerbeam@gmail.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY
 frame interval support
Message-ID: <av1pyqEEPqwG8gz5@stanley.mountain>
References: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:10PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
> 
> Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
> by storing and retrieving per-pad intervals from the subdev state,
> following the same pattern the driver already uses for TRY formats:
> ACTIVE intervals stay in priv->frame_interval while TRY intervals live
> in the subdev state.  Add a PRPENCVF-specific init_state callback to
> initialize TRY intervals from the active default, and move default
> interval initialization to prp_init(), which runs before any state can
> be initialized.
> 

AI is great at writing monkey see, monkey do commits but it sucks at
writing commit messages.

What difference does this make in terms of the users?

regards,
dan carpenter

