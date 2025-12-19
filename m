Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A840E241CB7
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130414; cv=pass; b=SdtGJlSYqLyU6B4lx58YoFAjaOIa7LVrm83tlPQsA7TjRHOTQYdvilkGobyCLcKAXt+nJ8GGCXA1ac1HW1S98e6S2zXUKLYV5YBpmvjJmQTKZ2uX3OaMhZhcSUR+EksV+i38+7Xns5CAWuyS2BLE049YodtOXuPkc6qRVf4GiJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130414; c=relaxed/simple;
	bh=lyWY5fexHjWzT5nxIzJlcIK8R3UIUXXesvpwdpZ4fZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BliaXlKGP4LpTI//H3PXXyaYgiSMzbT9/782FBQxNE1RGWIYkjoQT13vARGJsNIso7xUflRZw2A06+OrEhfeGrL5xo/s8y8Clx08TTvuHOTXm91ccTV12m6vpW7xTPme/pI/YPOSWXXROs23u1btsU2XyaeLMzR5+AU5dq4nmsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hwcuQYSs; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hwcuQYSs"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766130374;
 b=WbNx9u58a7ISMVag4SEVbeYrHa1naOU09wyO3APzeHKYIee/p72Tvq8gPEQwPMb91+lwReDr
 d5WshtSL9zr2Wl6aUDUb44s27Pa38UitI5mLhaYBA1a+lC8+dgB8jPBX/08JuXy7cGMNyecFegB
 g3EYEWxxJauKlDtO9lTE8KVAuZ4uB3Css/MhLGEl6Wt2N/XRzV2JCMI4OkhIv27ulKJwamwCN5i
 G+lOKFWV4LmIODSAO4x1TcYHgna0E0b78JqGKyzIBxNAxO3pHbSt7XV6ZKS7fgBXV1qCpEeKMjn
 qTKAmP2GS+9l2acR/R9kX1Ye2L7ZHUI3vmheRIC7N3LiA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766130374;
 b=Z9QA8eBTi2nCDT1FiQmll5MMVjIoFITp+ejP3JiL9RwDlZP8R/zOsbt7gyWejrbhEzuTMa33
 8jPuIE6g5zsM7gX3uDhKHAQdmgFu/xc6sxqRSJLLGvOM7qwuY/6JOYROOcOgjNWmESkVRcYQQhv
 YAFM+WqvuU9ZEgr8Rq7IWl4ymrJjQ428VyeBHfl3s42Qi+xPyfK6w6WTp38xukqTBTAa8z3ifop
 lTpBmcGQO2u36GGbf5UaGeA0rGwfBKHZHlPwd4i8m6VpnAT0VqPCynhFMZ8PYmgIX1Tk/MX9GY0
 3pp2zVs8qMgO/5dALdFDgrVUZVJkSAVugoBeC8d4hBF+w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Fri, 19 Dec 2025 08:46:14 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C0DFBCC0DAC;
	Fri, 19 Dec 2025 08:45:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode
 to schema and example
Date: Fri, 19 Dec 2025 08:45:57 +0100
Message-ID: <7637686.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
References:
 <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <3210190.mvXUDI8C0e@steina-w>
 <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4dXfjM6trLz2nJ7p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f6d1fa41e90d3fcf88d8c9a603ba697f
X-cloud-security:scantime:3.688
DKIM-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766130373; v=1;
 b=hwcuQYSs8nfBA4PJgKV7N6T1Oqf06Eol09VHXqwye8ty3dXAo3E3SEa0jF07iFbIGRaj4vrm
 rPnO1fx+LvT6qxKBG7GxvQez9b7Spl4BHfz3f/nrW/qOeED5Hu2wfwX/pMq2uggGdG7PRUXuZf0
 8LsCc+ZmHoFpUQw4yzxPcalKxQIdAl4dLQwuQCAW3RaCf+Qeahp8bspMDFSn4B2UY3bM5QkEZib
 eXdm4eh+tam9/265gbbvdm1l4fnLHDEiCgjIyBzHHctWx4tqQ2FBvFUealgtW2plXM3LfxuSm+a
 0UCgS6WRoLY+xm/GMYAgPNdC2LsUuWsbuVJ5AP5TDiptQ==

Hi Marco,

Am Donnerstag, 18. Dezember 2025, 20:08:41 CET schrieb Marco Felsch:
> Hi Alexander,
>=20
> On 25-12-16, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> > > Hi Liu,
> > >=20
> > > sorry I didn't fully answer you please see below.
> > >=20
> > > On 25-12-08, Liu Ying wrote:
> > > > Hi Marco,
> > > >=20
> > > > On 12/02/2025, Marco Felsch wrote:
> > > > > From: Liu Ying <victor.liu@nxp.com>
> > > > >=20
> > > > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register wh=
ich
> > > > > configures parallel display format by using the "PARALLEL_DISP_FO=
RMAT"
> > > > > field. Document the Parallel Display Format Configuration(PDFC) s=
ubnode
> > > > > and add the subnode to example.
> > > > >=20
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > > > [m.felsch@pengutronix.de: add bus-width]
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++=
++++++++++++++
> > > > >  1 file changed, 92 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-=
media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-m=
edia-blk-ctrl.yaml
> > > > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108=
b492bcbabc8a560d8e707cd 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > @@ -26,6 +26,12 @@ properties:
> > > > >    reg:
> > > > >      maxItems: 1
> > >=20
> > > ...
> > >=20
> > > > > +            properties:
> > > > > +              endpoint:
> > > > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > > +                unevaluatedProperties: false
> > > > > +
> > > > > +                properties:
> > > > > +                  bus-width:
> > > >=20
> > > > In v1-v5, I thought the output bus format can be determined by the =
sink
> > > > device(a panel or a bridge) hence properties like bus-width were no=
t needed.
> > > > But, if this property is really needed, then reference video-interf=
aces.yaml
> > > > since bus-width is documented there.  Should we reference bus-type =
defined
> > > > in video-interfaces.yaml too?
> > >=20
> > > You're right, the bus-width should be determined by the connected pan=
el.
> > > But there are cases where a 24-bit panel is connected but only the lo=
wer
> > > 18-bits are muxed. I added the bus-width property to handle this case.
> > > In the end most users don't have to specify this since the correct
> > > bus-width is coming from the panel bus-fmt.
> > >=20
> > > > > +                    enum: [ 16, 18, 24 ]
> > > >=20
> > > > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP=
 supports
> > > > below formats.  It seems that the enum here may tell RGB888, RGB666=
 and RGB565.
> > > > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> > > >=20
> > > > 000b RGB888 -> RGB888
> > > > 001b RGB888 -> RGB666
> > > > 010b RGB565 -> RGB565
> > > > 011b RGB555 -> RGB555
> > > > 100b YUV -> YCbCr 24 bits
> > > > 101b YUV -> YUV444
> > >=20
> > > This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =
=3D=3D
> > > 24-bit.
> > >=20
> > > That said, I don't think that you need to specify the bus-fmt since t=
his
> > > is coming from the panel. As said above, my itension with the bus-wid=
th
> > > property is to provide integrators (dts-writers) a possibility to lim=
it
> > > the physical available bus width.
> >=20
> > Mh, isn't [1] exactly about this? Not sure about the outcome at that ti=
me.
>=20
> Thanks for the pointer, I wasn't aware of this discussion. I skimmed
> through the dt-bindings thread and I agree with Rob and Maxime.
>=20
> We do have the bus-width endpoint property already. This property is
> alredy used by media and drm bridge drivers. Why not making use of for
> this simple bridge driver too?
>=20
> Furthermore I doubt, that a simple drm-bridge MEDIA_BUS_FMT_* convert
> driver solves all the problem in a generic way for all platforms, all
> connectors, all routing options.

Nobody knows what new hardware comes up with =C2=AF\_ (=E3=83=84)_/=C2=AF
Anyway we already have a similar problem on our MBa6ULx mainboard.
Current downstream workaround is to clone the display timings but
change the bus format. See [1]. Although I would like to get rid of it.
This is just the display connector on the mainboard causing the shift.

Best regards
Alexander

[1] https://github.com/tq-systems/linux-tqmaxx/commit/777c02480182d3054264a=
aaf80e1dbc40a02cfc1

> If the i.MX93 NXP-EVKs in [1] would have connected the upper LCD_DAT*
> pads instead of the lower ones, there would be no conversion needed by
> the PDFC bridge driver, albeit the physical bus is cut to 18-bit width
> due to the RPi ext. header limit, which is expanded to 24-bit again later=
 on
> via the Adafruit board panel FPC connector.
>=20
> In such scenario the output width of the PDFC has to be 24-bit else
> you would lose not only the two LSBs but also the two MSBs for each
> channel. I tried to visualize what I meant for the blue channel:
>=20
>                  24-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>                  18-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>           +---------+    |    |    |    |    |
>           |    +---------+    |    |    |    |
>           |    |    +---------+    |    |    |
>           |    |    |    +---------+    |    |
>           |    |    |    |    +---------+    |
>           |    |    |    |    |    +---------+
>           |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>=20
> The mapping can get quite difficult for a single SoC already, just by
> using a slighlty different HW routing (the upper D[ata] pads).
>=20
> Therefore I would keep it simple and device/ip specific (in this case
> PDFC specific) by making use of the bus-width. Specifying the bus-width
> property could be also wrong albeit it's the case physically, as you can
> see in my above example.
>=20
> Therefore the bus-width property must have a good description.
>=20
> Regards,
>   Marco
>=20
> > Best regards,
> > Alexander
> >=20
> > [1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.=
com/
> >=20
> > > [snip]
>=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


