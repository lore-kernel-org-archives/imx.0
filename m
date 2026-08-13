Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82B2F8E93
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639981; cv=none; b=e5lpka58nyxqzIDocuKQ7Vx0E5h0TUxxTKLWkSeA/6lyTOHttsIeEqwK3OthEgGNDL4nK0yLhk6WmIwOocZy911SRj+jy+2NXT4etqMTf4F3EWXD2hGDoQmQHv3GU6e+Bw0BnAoXKh9wNE99P76iMyGwRkb9tSHWNYE3+rSNQAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639981; c=relaxed/simple;
	bh=/6gR/F0NF4dyfxXmlPbggAK3SqSGZ8hEKLFz/6duBHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPG6AjWHmO6pnUp8xsdkFxWOI6U3PZxwS3ARY/pEz5MAwqFMTZXjL1AdOU6kYq7obZVbO64SuxZCIwYxKRLgD9jweSkJdsyzo+BLsuwrc4aY+9UI13yLKsbf6p5ti+37dp2NGRVmSkdjCeGebvQHLpAPwzyiFANRdQrOKIjdifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b50DVSWB; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b50DVSWB"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so2670189b3a.3
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639977; x=1787244777; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcOTGw+yU50xIcVPJ3wdwMSygvygwt98ERvGGHsAU14=;
        b=b50DVSWB2f9TFsaVaNJmCv0AYA3DQ0YOnr7S83phf10guxGGhZmwpMfoFYcaSGGRZf
         aI3pQYayP1q0z+M9gUkDvmUrfCwnHo9wpP1UW/RaISYdlcL1u49eZnS1P0s11qfZ9psZ
         nVzOwgbncqr/D3CTa98Pv0rvkoiVHshdMYXExSu9r4waIOtZMPTY5rLaO3LagEPzWReG
         +c/xRlhiiiXOmJaBcy9ttafSlNVe5Od7fYKttu1k0VgZBH02V0ixlT2RUU/kAJ4aXBYe
         PqNTDxPoObBJrs7Vw9pZRbacYFctr0sBikzZgu8dLmaD7MuPnxZmnDoqcwgj+eFS8bN4
         GrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639977; x=1787244777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcOTGw+yU50xIcVPJ3wdwMSygvygwt98ERvGGHsAU14=;
        b=OiwPxcbhEjNiNj6ZYkTll/RjxNRkzvl3VNohQcSk7hvt+as6s85NejhrZECtP+utyp
         ypDS8ZjEwSTyTaLyHsbK5AVNQJlyLF9vOrZlBpH8+qwwwQGB0pBRFAx29gWmppdMEwck
         moLN9JwWflZh1AlNunicwhxlp00x25ZCDR/yMnHOT3kmK80yGcuoDgFejmRK3rluJml7
         aJZtWmQVq/hQnERtMNz9qA7bO0RdjNUv1lEyhMgS3QkTO7Wh2DX5XUXNelD+MK7rKyXM
         mG4YLi6iGsMSzs95c8Wg4+EBAahgmTy6Mc8HiylfG5yFaquaRuATClzBJ9mwBdDXLqEF
         MH3A==
X-Forwarded-Encrypted: i=1; AHgh+RpNHyxibBSfkXo3nJI1LY5FB/m/X0CtH2Y4q53n/Hsji/1gAmFo1Z31A/9qHc6aAAzBifU=@lists.linux.dev
X-Gm-Message-State: AOJu0YylJKcnDuxENzJBv97UENK/Q/yPocqRr8hISVrQxrdwSHwJ38Zz
	2lgoY5jsrZkjNPQvleIf1iNGOlgnbHonPOTzmLWK+gcbFqyPQz4oGbo4x16Bf5Ff60g=
X-Gm-Gg: AR+sD129ftYo1Rf+DOJYiL5IyuEtHFNxqUBlQSrXYMlJxtYek0OYPqHZXVeQtXPdsVj
	Xc6P6/I+Et9/heN9tEsYgIwPETdTJw2cYB5L5zq5FzQtmkjtmpts+bAMi16Z3Ygy0Jy3axaPYHA
	N/CxHf7dlULwecmuRraT5uGDUktmNLfMtTX9NhKJlXPaHD10tNSDXDy94Da5773nBRQqhU/0dhq
	9YEIrlUsIqiFWVTz4w44NeSTe8Ae+wCqnaXN7kzozO41gfn5v8yG5zzpulEznXHnJJGbHomV1hB
	8szqobZikTCuke1xJw23c5WGrES5KLMftR7O9rwLfHFaAzhxR9IMD2yH5h2lnAvdXiWDLB28wQJ
	tSNPOXCio7uPXTptnU28w2b929BcH8Q1R5PhcyBsRNK0CJSoL1cX1FkyIpYHghlF1XsK0qWDYvW
	qTQhwHz34H1ZxJ1MzsDqOAPkLfWB1NDGjE27zHc0r7ut3ghyV0/fnJjNg2nWS/o+hHFgk=
X-Received: by 2002:a05:6a00:e10:b0:845:e97d:447e with SMTP id d2e1a72fcca58-84fc760e881mr8509974b3a.26.1786639977197;
        Thu, 13 Aug 2026 09:52:57 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4566f8csm1221247b3a.2.2026.08.13.09.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:52:56 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:52:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, 
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
Message-ID: <6zpgl2fbn6lzmpyhdfvhgbt2um2ykehkfbkv6qgv44w4f6dyr5@wkarn773j6ol>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-2-leoreis.costa@gmail.com>
 <20260813135158.778871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813135158.778871F000E9@smtp.kernel.org>

On Thu, Aug 13, 2026 at 01:51:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The panel node name 'panel-lvds-native' does not comply with the devicetree bindings for simple panels.
> --
> 
> --- Patch [1]: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS ---
> commit 9fa4254322a01ecfb1f9a0941237ecac9d2bf3f1
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
> 
> This commit adds a device tree overlay for the Toradex Capacitive Touch
> Display 10.1" LVDS on Verdin iMX8M Plus carrier boards. It integrates the
> LogicTechno LCD panel and an Atmel MaxTouch capacitive touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
> > new file mode 100644
> > index 0000000000000..9079c6284dfae
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
> > @@ -0,0 +1,95 @@
> 
> [ ... ]
> 
> > +&{/} {
> > +	panel-lvds-native {
> 
> [Severity: Low]
> Does this node name comply with the generic panel devicetree binding schema?
> 
> The bindings generally require panel node names to match the regular
> expression ^panel(@[0-9a-f]+)?$. Using panel-lvds-native might trigger a
> schema validation warning when running make dtbs_check. 
> 
> Would it be better to name this node simply panel?
> 
> > +		compatible = "logictechno,lt170410-2whc";
> > +		backlight = <&backlight>;
> > +		power-supply = <&reg_3p3v>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813133335.1941580-1-leoreis.costa@gmail.com?part=1

Is the panel node name required to match this expression? I can't find
it anywhere in the documentation, and other overlays also use the
panel-* pattern.

The 'panel-lvds-native' node name complies with the schema specified at 
Documentation/devicetree/bindings/vendor-prefixes.yaml, and 'make dtbs_check'
runs without warnings for these overlays.

Leonardo
