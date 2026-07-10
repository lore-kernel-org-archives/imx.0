Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93579350A05;
	Fri, 10 Jul 2026 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672467; cv=none; b=jZR9x0a6eKTMJphEssc+j1uCDTi2ExhrvP428561rrPUtxQFGYuZI12eH85AmZ9UNhApXhj8LktpxiRDmHCHOqpTD5lY9cXFDYDAadnFAHMfv9H5kTaouME0SraIQEahhpHcaQtYidltjwJIKl6f74xP6D+Tk4rhxaq2uVv3jEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672467; c=relaxed/simple;
	bh=MmIfI3j6A+H6MbxUUARTY4aiTimje4EwkQBFA3k42S8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g+EUKwTtspPI6mEdtzKx3yqirNqypAETmBGhOQDzzOz9hZ9GLRvkWDD/jHDdzccmMORJrFCrgHfs/txPutM2GQlKRX/ASMxbea94i5B+OCvjcrXPVAoTbKJk4Ecn+yD2Nf0QVR0GZeAsr1gVzZfqJ1/CzI7c2Fa3yOPOHUuoegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FndPw3mC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FndPw3mC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB11F000E9;
	Fri, 10 Jul 2026 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783672466;
	bh=M6VEkS/wUAxRCYRHM7crNYfnXmrRKcUSQW7PeKQCd+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FndPw3mCgdlwKrX+U8i5YH1pS8laTCZovoJEaw1pMKYAJQitn4mp1UBcnggVet6Mi
	 re5YvlZy+R2oeriRC6o1OFksdIKlrtNryN/yr3ashOvpSlV4EmL2AOr3JA0M8VDUBc
	 jpzSDiWBDziQbtaxQBslEefxUq3z3ozUQAtwEn99H3wahbP+2A9QNazkDKuupB+cS1
	 mpGIMa7M4joZ39klYMAp6mZ+ztYo5suN30ecXXXsIxFA9yyVEYHTMMv/nG/uivKwUE
	 4H+k0EYyHYpc783NOgYSFcqL0Vdjm9tZCUtYOmQZU42y11vONWS6JHlH6I6AU59ArI
	 kAG+bEFMOkeXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: display: sn65dsi83: Add output
 data-lanes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wojciech Dubowik" <wojciech.dubowik@mt.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710082630.394040-4-wojciech.dubowik@mt.com>
References: <20260710082630.394040-1-wojciech.dubowik@mt.com>
 <20260710082630.394040-4-wojciech.dubowik@mt.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:34:25 +0000
Message-Id: <20260710083425.B7EB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between device tree schema and driver implementation fo=
r the `data-lanes` property.
--

--- Patch [2]: [PATCH v3 2/2] dt-bindings: display: sn65dsi83: Add output d=
ata-lanes ---
commit 98aea58cd5128c6a4b72efd4a5f9ec088fd30dca
Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

dt-bindings: display: sn65dsi83: Add output data-lanes

This commit adds an optional output LVDS data lanes property with two allow=
ed
values. It supports the standard layout <1 2 3 4> and reversed layout <4 3 =
2 1>
for output channels.

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
3.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index e69b6343a8ebb..4431f113bb9cd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -86,10 +86,52 @@ properties:
>          description: Video port for LVDS Channel-A output (panel or brid=
ge).
>          $ref: '#/$defs/lvds-port'
> =20
> +        properties:
> +          data-lanes:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array

[Severity: Medium]
Does this schema change place data-lanes at the correct level in the
device tree hierarchy?

The schema defines data-lanes as a direct property of the port node,
but standard OF graph rules and the driver implementation parse it from the
endpoint node:

drivers/gpu/drm/bridge/ti-sn65dsi83.c:sn65dsi83_parse_lvds_endpoint() {
    ...
    ret_data =3D of_property_read_u32_array(endpoint, "data-lanes", data_la=
nes,
                    ARRAY_SIZE(data_lanes));
    ...
}

Because the driver reads from the endpoint node rather than the port node,
will it silently fail to find the configuration and fall back to the default
layout on affected hardware?

> +            description: |
> +              Array of physical LVDS data lane indexes
> +            oneOf:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710082630.3940=
40-1-wojciech.dubowik@mt.com?part=3D2
