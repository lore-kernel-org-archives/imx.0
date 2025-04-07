Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F153EA98
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 16:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044408; cv=none; b=GSpYppG2LiCl85YGX0/Ns3zkzlAL10UqQNuVvkrkXgYE12ap8bj9YyIV6um/AjrZRtx1tYb95EBLPR8ohMSHMeUg+4jOm9v4D1wEUUP4bzxa4tn90rHG0ZbT74yvwbVFIbimEbYhSxMVuGAkUzR/Oq9vy2xkM285346q2fWal9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044408; c=relaxed/simple;
	bh=RfwQQ9O80Lh+rIRuZORWFQZO7TkItzudgoruhM85HTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1uv4oqlgz3qghS5w5ndq6xCjzCrURC/d3apyqeqjPSZkV44TLgs/0HuCOcdbq67qEqbD/LCdrefqze74Vy7PVW7gJfAjoa9JN/0My5aMR3r2c9wD4Cg57owHohm186x+nkIzymaZH9JuItJrUjS/Bm560udcTqarMHt0NuaQ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6Z05Ti9; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6Z05Ti9"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf0e07947so46093646d6.0
        for <imx@lists.linux.dev>; Mon, 07 Apr 2025 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044405; x=1744649205; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=R6Z05Ti9NpodCvAvG+38mFHj94gbiZ29oIgZUnIpTuzMfip3oxvI0T4GJGN4EV9YIp
         xTDvRgZFf2Xks+k0Ch5E1ucTL005ygSALDvPE9rOtbqn84KrdbSuF52cDlO/dm/oDI7x
         jbAqzB9I57H2XR6dUUALbnfFH5KB2Zkit0wQ0jBzv0xqF78grnhFwa82Zb50x1mpzxYZ
         P5EAFMOhEq7EFfNL9i1tfcKe8YBZdlQw9/DW1Jv/SUyz0VXxIhd1YIQu5xS3SVgL8y8z
         P3i5sLN93hxMqwh7g/px6vMabLYz5nta1nrJZHaeYRRo320Oq6kRebYCsC9uLU6pFnwV
         pY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044405; x=1744649205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=GjXLv6gECaf7qaI3V1jXe6YBaiN2Tr483mUI5cVdbzGolG4xy7SClQG6PjlWpmL4rF
         H7Cvfr6+u1v5fV/YQ/trTe/a72D7KubX/cTGafuZJlLGdpNmsfvWvQY97U+aNDFq0RvR
         YcYuJSHtr6slCjQimLipy0YVGwQBBRfdWTXNRPhThDZr6VZw3kT4sR+sD+0QrzIDb5Mv
         dOz+K6U3fXnBCmcd00TvtXom64Gf7LmB9+C6ZfTr4Svo7+2DQTJV/FcVT2IEysNu+fvU
         nqx4WElYp7ae4Wu40hwX2ELVDeYS6tnHggfQPHuq0uNuTcbEYzLlN8lcEmrsVvk+JhnF
         ZSQA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZcLV67NffWsQgrYPolKygUdFOgdu7Bpemg6rTQbp2bbNVwnY6YDxjXBcqRFVPTk1em8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKdYeUP5fAE7WzK2OBi0mefiFOEQWrpr5vJ04RHf7ERIMerBfa
	5T+hZjrKMuShESvjcy0g+qsSAw83+gUXTL6z96v1RzecbP9YGW3jFH3N+K82dgl0I+DieK04sBW
	S15LNbU99R5ZSjEwAesbCnyCQG7Q=
X-Gm-Gg: ASbGncvZEugmQTKqPKbUj5wxZ+q6j4DSvmIjJaUMscK7xw3LHcuG2qbXZbuQqvFpBk6
	zgMZ646iQz9oFjb+oATvjtJ0tc9v10A1xGYVxCEFx2RlD5ntdbrTeuadxxolt/QTD5nIRuu32r9
	fbZIzdnQmv2VaHBoTGXNWJn/TW
X-Google-Smtp-Source: AGHT+IHn1NWvGQNUg+cTWq77arIBOMg99zSiThdNcGxwwVSUpNgoUD/iAcjqlZYjSbS/ACMXvRhNvnrbFKc+S9VTrwY=
X-Received: by 2002:a05:6214:1307:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6f0d24ed16bmr3696846d6.5.1744044405300; Mon, 07 Apr 2025
 09:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390> <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
In-Reply-To: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 18:46:34 +0200
X-Gm-Features: ATxdqUHTe6GO-vqbSM3EmiJ-FaS0XfNSqylpsewp4c0XXyMi1WCC05uIygoRAqs
Message-ID: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, upstream@airoha.com, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Clark Wang <xiaoning.wang@nxp.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <michal.simek@amd.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:27, Kory Maincent wrote:
> > On Thu,  3 Apr 2025 14:18:54 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> >>
> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >>   the Xilinx PCS) (patches 9-10).
> >>
> >> The last few patches add device links for pcs-handle to improve boot times,
> >> and add compatibles for all Lynx PCSs.
> >>
> >> Care has been taken to ensure backwards-compatibility. The main source
> >> of this is that many PCS devices lack compatibles and get detected as
> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> the devicetree to add appropriate compatibles.
> >
> > I don't dive into your patch series and I don't know if you have heard about it
> > but Christian Marangi is currently working on fwnode for PCS:
> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >
> > Maybe you should sync with him!
>
> I saw that series and made some comments. He is CC'd on this one.
>
> I think this approach has two advantages:
>
> - It completely solves the problem of the PCS being unregistered while the netdev
>   (or whatever) is up
> - I have designed the interface to make it easy to convert existing
>   drivers that may not be able to use the "standard" probing process
>   (because they have to support other devicetree structures for
>   backwards-compatibility).
>

I notice this and it's my fault for taking too long to post v2 of the PCS patch.
There was also this idea of entering the wrapper hell but I scrapped that early
as I really feel it's a workaround to the current problem present for
PCS handling.

And the real problem IMHO is that currently PCS handling is fragile and with too
many assumptions. With Daniel we also discussed backwards-compatibility.
(mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
that slipped in before it was correctly complained that things were
taking a bad path)

We feel v2 permits correct support of old implementations.
The ""legacy"" implementation pose the assumption that PCS is never removed
(unless the MAC driver is removed)
That fits v2 where a MAC has to initially provide a list of PCS to
phylink instance.
With this implementation, a MAC can manually parse whatever PCS node structure
is in place and fill the PCS.

As really the "late" removal/addition of a PCS can only be supported with fwnode
implementation as dedicated PCS driver will make use of that.

I honestly hope we can skip having to enter the wrapper hell.
Anyway I also see you made REALLY GOOD documentation. Would be ideal to
collaborate for that. Anyway it's up to net maintainers on what path to follow.

Just my 2 cent on the PCS topic.
