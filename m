Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347F3DAAA9
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703675; cv=none; b=HBWY3YtBZEuUwRwtoCzamPTPGBh4TkhoMKipY0+4IFKPLPVhmcUvXgcZzBLpAAvFwIMfwziLfDljWXXO1pmV/q/V9uPzOj3R99vFQ9ZTXVlafQwwPC5fC28tE1D1lTkJyHIlMjI2L4CSiCc2u8nhUG0WUM2LC28kZ7UvL1nz0oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703675; c=relaxed/simple;
	bh=TYK82yEFZyTUKcvmqFCrtcuvaXuFrEA017DIBbyHshY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXjcqcqzrnm04jUx6xkaBvKrOq0XJlj0PmQ/Fz5M6gENubfmeUtFIHuX6AZFn8v60LlgrS3LWJlab0+kSU/8kNsxqh8MHouRrgU0lmq1horXd9bsLcKdLuZJrOEIwAYH4uVkpL4wb2E1d4Nwi+6GTw9UdcXDW5rlNYVxsitr0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWVUbrqt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWVUbrqt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so35094475e9.3
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703671; x=1791308471; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XT6rzbwAq56nChpqUTQ2q9VsJKHTV6VFi8vBlbe3c+g=;
        b=KWVUbrqtmUZNzFMonCNqBKUzExdpjoiJ0lH76fV83d/OAn4pAcVMutTXUbhrdy92t7
         4DQlHUs4UId+QmwUO9c3Vg2QE/WfaYbOVEIJcfaXHnEDXVB3Huxy/NhoU4ZZ7ozYXwN7
         VKM3bZI1aq5yroeqc5Ii6ObHOsB4O5HO3AsTk40XVkX2keT9Rs7KMLVzZNlIMNNTJ6mr
         wzsDdXQjwkbhlwFQC9o4YxcQ/b/GIhV06RxqKLt/MEPABkixuQijDBg5KJ3We5UKPMp3
         KExDRflAgQYiTe2DwM452OwLzpRXMxlFvTf62K9ICSaNjWhSMZSUuG+mGZifKdx97K8n
         41fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703671; x=1791308471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XT6rzbwAq56nChpqUTQ2q9VsJKHTV6VFi8vBlbe3c+g=;
        b=Iyz7hbDModYGH9J4ITzuFBQ5Fd4D5jFydGQR+tKt/wcXV+JU9044S/xd1VSKwPlUth
         Joy76WsdANzfOu18PAzW8qywD1DgnHe3gB6gacunMzSLDw9BedvYF9PqX54H+5Ayvkrd
         T8ZbyC62b478sRRu1e29slJdGfqLmpVIX0HFZKYKlACy5DA1xLUUfDR1EjxOdNEOQtP1
         ghXIMJL7+n50Lhne8M6Wp6oeJ6Weq6C9cdwOb939gj6JGrQO95FO7Pnv3z+s+b90SHB+
         gdngPPC37K4XeLSDXEmPoqORAZ966VlzyQRNFErNxCyegUsos8EP0J5sndh5BGv1MCyN
         8dxg==
X-Forwarded-Encrypted: i=1; AKwUvBzA1hOBOAdW6lzDvCRcGKIXZ0+8aU4G64Kqx07Z6Gu3G/FT1ZW6S7e8AVtdgKe1AIYNrZk=@lists.linux.dev
X-Gm-Message-State: AFuF++md6jkgO6QKk2kYVqomGkAs7/y/xbu3KBwZlA7okMfc6/F2Ok5H
	CIZCVp0PxH2Z3yG7nA2GgO5kvBJOox+Iw/oLO6iTo8/2jI0UjEmicQPU
X-Gm-Gg: AYBFou3tbZKaSYFM3D45ckQf8xTkOcBR0t+RisVvkuZvQGiTCDw7/jjjc+k9VHXYm++
	7FeCR55/LXBOtCCfEDwzojjyEmGLLsZYAvWYUGs+WAvZV5NJTilIdQuSiJlBf9ZMyCr2EcAjtwd
	kGlJfRKNqSwiRsDcFB7DmUZWRl+yqG8rdPUZ0b+/AId0/MfZu4oCATulxmqTia+b8h3MdDcb2gO
	K6DO4CvqmbGYhm4WgQZm8OMt3EC2StgFcM9hU8ojMmB2t8x9NE1GLfGVT0mlqD7kw56q2CfGFW0
	6LDVrG7/czJjBPwyjoRnPpBvsP6b2shec3B0HvSKZaE3IfuHkNJg1I2o3XYidXmEDE3uCrU/TN/
	YpAnaMxTJ0ZDx5karf0m3vCBqQHC1kQZEdjcJd9cvI/QrLwotkm5GbbURQwz0Izv6zpokPSf75J
	DDqFC7fp4+BQuvWLnr7PZdzonhV98xZTq4msVmmSBIvXMMHRVOMFkFOrPE4A8XGf8KHZvB40LaG
	i0WAV/F7Zy98TSbezFr/ik/a4qeGTVsfZ1yprLuyeCJv1wxEnlNMUcfqthqVAm2MGFgSuXaiDKZ
	msQZMPSc6KS4bhG6eYn11xdnu+Nx
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr177606485e9.13.1790703671207;
        Tue, 29 Sep 2026 10:41:11 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm100002515e9.8.2026.09.29.10.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:41:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 19:41:07 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and
 DART-6UL
Message-ID: <arv4MwHV4LntROkN@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929121455.437291ea4b53130e3e19778c@hugovil.com>

On Tue, Sep 29, 2026 at 12:14:55PM -0400, Hugo Villeneuve wrote:
> Hi Stefano,
> 
> Your title seems to imply that VAR-SOM-6UL support did not
> exist before your patch, but it did. Please rephrase that, and
> your description accordingly.
> 

Hi Hugo,
You’re right that VAR-SOM-6UL already has mainline support.
I’ll reword the title and description to distinguish the existing
support from the new variants and DART-6UL boards.

> 
> On Tue, 29 Sep 2026 17:17:27 +0200
> Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > Add device trees for Variscite VAR-SOM-6UL and DART-6UL modules based on
> > i.MX6UL, i.MX6ULL and i.MX6ULZ. VAR-SOM-6UL is supported on the
> > Concerto-Board and Symphony-Board carriers, and DART-6UL on the
> > VAR-6ULCustomBoard. The 90 new DTBs cover the supported combinations of
> > storage, wireless and audio options.
> 
> Do they? You would need far more than 90 DTBs to support all options...
> 
> When I submitted the latest changes for the VAR-SOM-6UL, I did not
> create DTBs for every available options knowing that it would lead to
> an insane number of files. So I simply created a full DTB that
> incorporated most of the DTSI options. And my custom boards simply
> include only the required DTSI for their specific options.
> 
> Looking simply at the ENET phy level, you seem to have now removed
> the two individual DTSI to selectively add support for ENET1 and ENET2,
> but not all board use these, so that is why they
> were created as individual DTSI files in the first place to make it
> easier to create a DTB with only the required options. As an example,
> one of my custom boards do not have ethernet at all, so i don't want
> that support enabled by default.
> 
> Please keep the existing DTSI as distinct and individual files.
> 
> Maybe using DT overlays would be better suited if you really want to
> support every available combinations?
> 

Just to be clear about the 90 DTBs: They are the minimum set of prebuilt
DTBs for the Variscite-supported configurations that select between
mutually exclusive hardware alternatives. Selecting an alternative changes
the hardware described on a SoM interface and therefore requires changes
to Device Tree nodes, pin configuration or controller properties.
For example, the SD interface may connect to an SD card or an SDIO wireless
module; storage, wireless-module and codec choices similarly require
different descriptions.

These are not every possible combination of fitted and unfitted components.
We do not add another DTB merely because an optional peripheral is not
populated.
This follows the existing VAR-SOM-MX7 mainline approach: it provides
separate DTBs for hardware choices such as eMMC versus NAND and codec
variants, without enumerating every optional component’s presence or
absence.

> 
> > The descriptions use shared module, option and carrier DTSI files with
> > SoC-specific wrappers. In particular, the WM8904 and WM8731 codecs are
> > selected explicitly instead of keeping a codec in the module base.
> > The four existing Concerto DTBs are converted to this layout without
> > changing their DTB names or compatible strings. This also replaces the
> > non-working legacy LVDS panel description with the LCDIF configuration
> 
> Can you describe what exactly is not working? When I submitted these
> LVDS changes I tested the LVDS panel with the Variscite concerto EVK
> (VAR-SOM-6UL LD option) and it was working ok (also tested with two
> custom boards).
> 
> If a fix is needed for this bug, this should go in a separate patch.
> 

In an initial hardware test, the display timing behavior did not appear
to match what we observe with Variscite’s downstream configuration.
I will repeat the test and measure the output before proposing any display
change. If a fix is needed, I will send it as a separate patch.

> 
> > for the Variscite display. Wi-Fi and Bluetooth enable/reset sequencing
> > on these modules is handled by userspace, so the legacy kernel-managed
> > power-sequence and Bluetooth nodes are not carried forward.
> 
> That is not ok. I specifically implemented enable/reset sequencing in
> the kernel to finally get rid of the need for external
> proprietary userspace scripts, and it was tested ok. If somethings needs
> to be fixed or improved in this sequencing, fine if you submit a patch
> to do it, but certainly do not get rid of it.
> 

Calling these “external proprietary userspace scripts” misses their purpose.
First because they are not proprietary :D. Second, because they implement
the initialization procedure Variscite validates for the Broadcom
modules we ship (talking about the brcm, the existing one in your DTSs)
folowing the datasheet instructions.

This is not equivalent to the sequence in the existing Concerto DT.
For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
re-enumerating the SDIO device.
The other Broadcom option does not use the separate WIFI_PWR step.
The existing regulator and MMC power-sequence nodes do not express that
complete, module-dependent procedure, particularly the BT_EN step during
Wi-Fi initialization.
The scripts also select the Bluetooth firmware according to the detected
SDIO device.

We use that procedure to avoid sequencing-related failures for our
customers.
This approach is not new to Variscite’s mainline DTS files.

Thank you for your time,
Best Regards,
Stefano
