Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B94EE843
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453415; cv=none; b=TKxXpIrYrtKfJDpWH5/MEkIByBTGTAQGgzykXOMh8pX8Qvx03B7BwStVXPQWfNntSozntrJ/hBMCye8Jnd0i+YBeizaC2jDgPKM5P1Ohdp2O2NG5mdWpmS/ot4UhIhJbAc27NxO7evfHjwYDAQVhn8Nt7bKzdsV0IZGJwnYOBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453415; c=relaxed/simple;
	bh=XydwLZg79QE9i6WsiKtoR53n4EvTxMwuiXwTwuu7/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0Hy32Xa7PISTd9IigUdDFPISLlI+3aCGHObujpIv3tYrNO9ZiMFaBtgogsBlcPSHa4NQssUHg7IeS5ePf++ojGxK2j4TdO8+/z2GUHBKPQz/5CgpeLbICWq8FLvEfSpbup/ClWPBMDqXwl4TCUivjHwNgQ2srKHs0azxY/i04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlQwKuX5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlQwKuX5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3330809a91.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788453413; x=1789058213; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=PlQwKuX5/kqCTcW3oMyTfbFlaOlmmlvXqelo5FSwnVVshPA9Qa2BBw+NwXnloOaPVx
         F/HoZTnECcNvZs65dNKoaeJyX4/86xHMdRaDCyfwzVqohC2TpGRZbIKP5n2fwLQbx36Q
         A+vy3EEgR6yaaS1awxJbFLhEJrVvRcZPjCKQWwYNaV7Boamtx0hZc7XZEd/fTEwF9S8v
         HYuaAIRVstlqboi7LcPp9IG1aVkGDXtpPDD5N8RvDU6C2yhA8ZVGf4TNo0yehUdWC1Sf
         7EdMmIje1RRt5tWV5qO1fLbAlNNPeGbTXnTpG16mauulM5y1HAJLsGaRpvz1Yl+2Z1LP
         0Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453413; x=1789058213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mx2bivaT9nHj/TUUekmKHf7Mi+OS/7gBxKis+Uo212E=;
        b=J3ASK3p6Hrbqv0bqi/CtDBMiDlczq9ero2PvPIECzfxLccDtr1OBEkVf4sFvBLcoy8
         M1CGpiSD+27fLvh5OTMn+JYWtOvAmYXav/yPY5DUQRNOob+xxPb9fL/T0+T6jpmnPRhI
         NIoQ7G+vcFwScCVPzzxzcuw2m73a5DTVRU+y7toFWgmX6dCBzNHpwkTj8vf5Prao3IkL
         hAdqCkfqMqSjusGnzzdyrwsBm1nB1CWCiQ+uzbNySprModJ7dA2HW/I4hHFIF39MebeG
         4IHtqrCx7cBSTaxQJqu7r/d1jKsxk2zyj0788o+oKb/Vf5hESYyjKIVP/ljYuqSNcp0T
         wVfQ==
X-Forwarded-Encrypted: i=1; AKwUvByv0bcEeCsA4BaIcPIKF9rTLiN2K74NI7/mtjoQTpdQmLWABZT4SR2gK6dnP5C2F0d2pb0=@lists.linux.dev
X-Gm-Message-State: AFuF++n1pFa1cKTkYWYYPL+n45eHh51JL1/kfDK2i0n52NEMzxso7xJj
	fMW+brD8AYx5c7TzfEJ2mwvKng6OW3yECNnP5wAf3idgfUSjR5vpLpuU
X-Gm-Gg: AYBFou14e4aZ1W21GcBF2lxygk5CTUqAoXNNEu1XGvU5ZYLG8L0sOWQu9HG4P+VCcb2
	yHd0IAvf2FC+5qYid+BiffROYUxW8mFsN/fn+XaSkXWBJii5OKjEdlqsK2+yOR1bE/x4zuYINtY
	ejo/VeN5kzUxXKz4Kt13vIT/MLkIeBpk96Mgypi5hU9pKokXPnwXXzKhEmDhO5wJozVpGc406zN
	NxkBdUfDOSsv0+Tl6T0h3mQVwDeHpDK6yLDOum5A2XSnHrkPT6lWjJG6vYq5llt5O6zac/Ocdmy
	naeKsNxBcCGJObHIdgAuyPxQ1rW6p2UkVU9os3ola/wpT6+TFICA4Grse6zJ4hTrAl4qurLt2jd
	/zpNDFXLw36d6oy3UaZyFIfL25TMEJ0Zxffi2C8Dbfq+3d+yAHJFDUqyyI8KZZxR3P1jsvgI3NN
	XiYyTKjsGqDBQg/hjjrGTaqAaEWoCq/75Ouwrkbrm4sqcY1s/KBmRjvA84wQIb/vHXdps=
X-Received: by 2002:a17:90b:2d83:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39aee049464mr22342206a91.15.1788453413101;
        Thu, 03 Sep 2026 09:36:53 -0700 (PDT)
Received: from leonardoc-nb ([179.160.36.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm115281eec.22.2026.09.03.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:36:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:36:47 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <tu5f2ffhfe4vxw2mmdz5qy7svu5a2wi4on3ixrx7zn66chnim2@3tb2jnwp5eke>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
 <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
 <aoW7M1CmaPWDxvhE@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoW7M1CmaPWDxvhE@SMW015318>

On Wed, Aug 19, 2026 at 09:18:27AM -0500, Frank Li wrote:
> On Wed, Aug 19, 2026 at 08:56:53AM -0300, Leonardo Costa wrote:
> > On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> > > On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > > > It seems that the drivers are being deferred at boot start by the
> > > > device_links_check_suppliers() function. It runs through the drivers before
> > > > they're initialized and defers them if their suppliers are not available. The
> > > > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > > > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > > > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > > > the nexus connector node only, and since there's no compatible driver for it,
> > > > the function defers the consumer drivers used in the overlay.
> > > >
> > > > I think this is what is happening mainly because setting the
> > > > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > > > flag) solved the issue, though I could be misunderstanding something.
> > > >
> > > > 	int device_links_check_suppliers(struct device *dev)
> > > > 	{
> > > > 		...
> > > > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > > > 			...
> > > >
> > > > 			if (link->status != DL_STATE_AVAILABLE &&
> > > > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> > > >
> > > > 				...
> > > > 				device_links_missing_supplier(dev);
> > > > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > > > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > > > 				break;
> > > > 			}
> > > > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > > > 		}
> > > > 		...
> > > > 	}
> > > >
> > > > Has this behavior been observed before? Do you know of any work being done that
> > > > addresses this?
> > >
> > > Does a dummy container driver (for debug) to proof your analyer?  Let
> > > me to find time to debug it.
> > >
> > > Frank
> >
> > I made a dummy driver matching that compatible string, and yes, it did
> > solve the issue.
> 
> Thank you very much. Let me think how to fix this problem. Nexus node
> should be direction overall.
> 
> Frank

Hi Frank,

FYI, this patch sent as an RFC addresses and solves this issue:

Link: https://lore.kernel.org/all/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com/T/#t

In the meantime, could we have these overlays merged as they are right now, and
refactor them to use the nexus connectors later, when that patch is more
concretely established? We'd like to be able to have these overlays on upstream,
but we're not sure how long it'll be until that patch is mature enough to be
accepted and merged.

Leonardo
