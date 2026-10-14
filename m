Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108A51EE12
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986276; cv=none; b=TpmmogY7YWGcGoCHWw8Xv+X5KLhS/h0d7znD6RGuMaU0uOsyoXc1kR5mxqsA9Vuro39csTAkP3FsCUu5PsdqgIQa9EdM0wP7pD7rGW87dxUuPHKxPPRx3+MZEhJlwLUY3Ahk1KamGsgiEmigUvwKqol0EukMGH0XaY7nCQFfGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986276; c=relaxed/simple;
	bh=TMXUtKO2nNHGtsYqDTL68aTnNZaX3Bqh2FqKHXbmdTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zs2d4KBlhs1OrMAfRVSB03zszaXzrytWnPVFzmmC1t+F31lXG5Z2uR1hpqN5kBE3bc3nvKOcpgiRckanphpWIj6k35zlV1iQpDBieJIzumgGTAxCaOYoYrOTKUuqyDl3w8L1s3/jTO5KOvCJEbMiaofmu8gda7iBFUIGZ44r618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3bbyGUl; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3bbyGUl"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28d9537bcso2977762b6e.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791986274; x=1792591074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=j3bbyGUld5Vjbu5EiddkW9GV5geeLTgeyJFbi7XJbxQLL3D2l2jngfOf6LqQb70zcz
         ZmzVPaPmP/luHwv8IG503XTPU5QyPqbmfmro/mJyraZRcoemqDsG4Unr2SC28fqrsZnn
         dQlQ4pAoVeomPPHWZdOLrrCu9tS9S1+koWf4idFzbhtKFJf6+uI8h7u5q2PRIkbrkTm0
         qEChbpxuu9iK8GOSQ/NOs6gH9FzWEEDekzwMp1SyrZ3RmtWhGx5X/l9n5G5QgwNDfm6T
         UcbDkeVk0UrfUPbqAKEW3Wf5aIMeHng+C75IIy8hDKlXc/jWTpX6PoBCFqTGGzKiq89X
         GRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986274; x=1792591074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=iaPeHNux+GCkOEGAY+8vNqavedXVpfs68Ibsqu3Db2yw1kSx0DajXVk4s51cYfy+ro
         zCoJ3kqePD2z5/ZXlRctjSKr+2kV1Gtw8LBGzCJ41rh55XSSJ4g39PTSH5D197H9esps
         TooDKnBlnIH26pSdjsxcR+9cDAWcbVJ28rJcnBCnnSfa+VrqRNIw8G8sShDXWQK4O2Ms
         yzAVK1o1gV2V/6qSK0JgpwowCGRO0F1RP4t3cffJOG0U4feVaeL6WOGJd2sg3eyyBpqV
         8mHaH180vvntPy1jl2KlUXWuLirpJ2DMZp1dPFPiqtVFvhRyGV2/E4vpEeesCkgZKauH
         J1fA==
X-Forwarded-Encrypted: i=1; AKwUvBxl8+pnRhaWEzfwxBVhsatXpQDcW5qzHQWLMFuAJvWBrtae1kaZ/PGUcqRLAcLGHtV5qzw=@lists.linux.dev
X-Gm-Message-State: AFq9FYINVe/f/SZsyDiwxsxLqq7HGuvHPwi+arv3DeZ0J2y69Fg3KPAj
	StmACF1RfvWvFc1FnWRzc6f2M7lDJWawZY4Bj/mSMbiBZ1yMLrB8DH71
X-Gm-Gg: AYBFou1C9RDoWLfszUoW6rF4IfqavlDb0o6nWManhH7XF6tqf7ijn7StOh+kOaLDw20
	Yg/AQIeBeF2OkzvIC7pnGMnqIJooBmmZ5ERsYyyuaLUoxlcOdvyFKcG6qpOkmILTq5Yw+RFn0MP
	B6JUByufutjuTvscT5ybjMoECHZmwC17C3F+Owut5UxlguAMRovT1r8pXuA/0pQqFwkTOXw/ETh
	6GJzpQ/O9VqXNrdXNy5Am2KezLcKG6TtcHwDU+xO0XERtW+9EljaVQHJp8fczVUByq79xoagHSv
	INEd3+8yi/1PLhg3oIKeyRTdUMEc2rWE5dPG8uwq4QcQ9NEyQPZnMrTozBqRF4hPxCPz8Of/1X2
	Vebzkf/LNDZbVTGSNtvvjJ7nraZgrzuQrgHFj26m5O61yG/Tezky5B5NgiZq63XCWFarsJCTmO5
	6r8A7s8kyQNWFw6g9mNsttHmp+VFbi6//9vsUK2YS4OgpMkhRzuXXJBaHv93hfD4enFRYpZ4LGi
	Mbs/nhYDHIAzhk=
X-Received: by 2002:a05:6808:1a19:b0:4f3:28f7:dfb with SMTP id 5614622812f47-50c516e42fcmr11298620b6e.14.1791986273875;
        Wed, 14 Oct 2026 06:57:53 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1815fd26sm17891866b6e.10.2026.10.14.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:57:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:57:40 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <druavdvcgm3rljk3mhano3o424xyelupmcz7kbzguuljdsungx@xuj2ovbvz654>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
 <20261013111158.GG56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111158.GG56180@killaraus.ideasonboard.com>

Hi Laurent,

On Tue, Oct 13, 2026 at 01:11:58PM +0200, Laurent Pinchart wrote:
> Hi Francesco,
> 
> On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> > On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > > iMX6, which is driven from a parallel RGB interface passing through a
> > > > non-programmable video DAC.
> > > > 
> > > > The video DAC is a simple resistor network gated by an active-low
> > > > data-enable signal. For the bridge to work properly, this series also
> > > > changes the following in the dt-bindings and simple-bridge driver:
> > > > 
> > > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > > >   doesn't describe a data-enable signal polarity.
> > > > 
> > > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > > 
> > > Is there schematics available anywhere ? That would help reviewing the
> > > series ?
> > 
> > This circuit is on the SoM, and the SoM schematics are
> > confidential and not generally available.
> > 
> > I tried to extract as ascii art the relevant circuit, hope it helps
> 
> Thank you, it makes things clearer.
> 
> The circuit seems fairly generic. Wouldn't it be better to add an
> optional property ot the dumb-vga-dac instead of a new compatible string
> specific to Apalis ?

See the diff below, this was the initial idea we had when working on
this. On one hand, at least to me it seems like something that other
bridges could use, and a new property seems reasonable. On the other,
since we don't know exactly how much configuration is expected from a
bridge in the simple-bridge driver, we weren't sure if this would be
accepted, and went with the simpler solution of creating a new binding
for our bridge, which also seemed less intrusive.

What are your thoughts about a change like this?

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..41b00a44983a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -171,6 +171,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -212,6 +213,19 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (!sbridge->bridge.timings &&
+	    !of_property_read_u32(pdev->dev.of_node, "data-enable-active", &de)) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
