Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=l5wx0o1blv+WRPcYOBgB4Cni9/MWppDD68b1dGoxANq/UI6qcpJwXVuU6n8bWbVQXIdm
	 lHqZlLR3N8BQAyJqwuukr3BfHSwsnnLDuoNgtnkTAZ2xr4v+XSIDI6izrfNgmzaa6ZwxY
	 bF8sZbkAKF4T9DfkQjh8gSIRKUip74NxSbpwtMl9wUhsqP2NLKzbVVwY8jpZImx4I/utL
	 vEzSFsLNsXmY+N+RiUzGEr3u2vXl9Adw/2yh905Xf+vg3Wp79qkei4VK7EsrOxX0hirXw
	 8YsRsZQvwvC2D5z/MyDyzXu6FBZufvlX7QEQWfoTms302q7iIAM1VKtMk6POfBopUWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=Cv6JGILYpYKwhaECdUlwE1urgyohQ+EGhFMa11GthKMUBYIkRDpDlTytNJdKpZEkgXxw
	 cEZCtskF+TD/d3yesUPefL0TXcxXb0UkPMk4tKY0EAv9PfEF/m7mFaR/lX3KssAnr3zBn
	 lW1Aj3VWm1zHB3MsM/txQWz4pil+C6np+T2ofKIvuLE2btMYe0BDRMafJKh/KiLuewKUV
	 StDY8NmpbZdsDT1kl7py+b/bJD8O9rvBJ7ML63r4e+wfyH9FYmojXPBC0EGS48bM3N0z8
	 D4JYBshrQkY0dCMgNH6yWy7HrHPGelRv/AihYA9BJSsyKG9f+rmtLWQoFeGlCLEMOiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew5OXGO7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB529606A323
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB529606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew5OXGO7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8410925e9.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=ew5OXGO7qsLHwNO7roJRSJXgl5WL5Pnrwrv7mnCuu+N7FNp/x8FOCSX6PKDoEC5Ii6
         6Q1aUeuD3ZSLohnNkKT2B5XLfdVxBO0VpRPz7UGQ1qyrWBBT3dg1BGLeEu+pmg88pjDG
         8IsCg5cNFh/qMOWTRx9VENKz0ZTchUvDkmNkSOdrYL4NRqgXPrOtVvL6i2yrZcM/EUi7
         Qya8VQczJ0QG6VIra+I2ucyqxo7Cfiq36g6gjjKzzLlSJUz+WKKB+It2CwoPJHcxnFQV
         fZ+WcjpurI1znEz8a1U5yVsV34anEhWyj++3yA3HIahWpkRuZBoPnGTEyKns1T+9Hq8+
         QuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=xIlpgLekDxpyiE1n8JvRPLOALDsCiq41cvPen05pdiofXUyoaAB4mYT1cy1Mm9l4Iq
         w/rE1MAH7i+HqCqQaRpPaqiUAj2ULTjwMzNqkmKwNr8QcnpkLzZrKp8s+CsEvr/H5x+B
         0TVVHN/GxKADxEV7Q/+kx55tZy3iL0TYZSXuHADDP3qei5fOJ8N3Ysj1meXpCI/UAMbb
         HxD2Gc9a32sQllgICQ0lFbBo9gdpcXZrFZCnSsuBWmPZtGfRVXKTiEEJsXKzh1zSc541
         rMWAkm77RmEmltMlb3S7AzA52+9u/EQecNM9GtB+8s17RkDzRamVhx01avMhDhiZWbyW
         96Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxAACDLd/MmviEzToWJ3clDI+pVz0uLX11ewTFW4R2OpYVpNGKCa5ZX1RB7mRYjtklAytw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLDY3N+pV3y0Rcyi+pzWwQXmkc5XohDxGhx+wGhJfC4o9Mod8CQ
	yX8d4fu4AsVUDRRfpTEEmFs0dY0pannPM+ULuqcnZbONh7lLpE78t4Gb
X-Gm-Gg: AYBFou18aZXioZvUbBsntLL0BdUe8EKAMpyKeq4Qt6n6N3VEnen8tNgwb/zkCorEQZK
	sKJJKccZ0Esw0VwqPd7FJVho03baYzFTT9BUg8ip+Axy9YVOn11RNCSys9hB5nQNr5Md7N+dmpo
	QcRDinFbHh9VAuTv6n5d0CiOkufCEjS6LmaWU3DepAvh1gvf/WZQcykwPRLYeYzby7f78mGtPEt
	K1nXUlx3TOH/RG7e363juniNMdZtHUNKL6S8gLyvwI39NzjELtUg/dwOpV6aOaKd0gxNDa7nObv
	/pruH4gjopXpHw6wlgke/emmEeOhFgOmT8RHJLnicgYD5X457oOy3mcq5qJWWokUCdRltEPmEC+
	tg9YZJ3vieD9EwHPpLG5MkgkPR2vUfjYFNWP3KPr+0W5J09QZPxV1NBTxs5kRq5/kFldxNdnRtV
	yPdnT428di1L8ayHJj34x5ey9/DxLhSIfcspIyGJih4Va16iYAfEXW8DZ3ewCWidkRzVS+H+ssB
	sDm4n1FzR5RA6OkHbVDxKWsdCiatCVS5gkS74Wihbc0HZW4hWMyK67h11EqlOz8+DQPWROEUurm
	j3Pf1ngtjV2xRhlGVTboS9Mco/5W67SmityTsmI4g51LiQrphwOUVfnwwyoREe2eqxoWmB873cL
	8mUIKam/1w7TMaQP6XrB3ZXfKTPpRYE4bIQt7IeDMcPJF8EJ7Rt6xhad7g59Nd7ExBjI=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
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
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

