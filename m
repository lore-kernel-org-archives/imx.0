Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7419A2A3
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770286330; cv=pass; b=Az82vk2djVoh3qu6Efg4DhqcHyDTwcTINe2Theu199EW2GexEQU2Cx/rI7liDVa7y2IICkfy49zyE/lo0JFT6g80gxF4Ywe9Bs8IzEmwPEVsEB4kjvBU4CecaTu4aAuDUgS69JRULfqIK9nurZfOznsczLQN4RljDzXBm6qUFh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770286330; c=relaxed/simple;
	bh=2g+mgCNqV+Ig8Q/l9oyCK2GWwV8YswGyWilOwDfVwcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOv+bAKigrYRk3xEejrv6CjOlOyUazwi7iOLVgOdlGL/+lUCo1wglmhTXZJJ1nHji8ftvpG0ITJZTYDYOqB8SOYjpuRLC7LRvEenbTc0S8Q4wulgCso0M+NlBUpyN/52weTuwlA04icXMlRYRT7w2gesWmnOo3O11o6OFUoi/7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgRiR20N; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgRiR20N"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233c155a42so1031318c88.1
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 02:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286330; cv=none;
        d=google.com; s=arc-20240605;
        b=B3GnNBCuOWxyM/Npfp+4EBeDuAqJP2HQr6HWRIjly8NOFXeyYsCvF40Ev87blQNQ7I
         CkDIjtSDl4MbaBf5ywRB2eY4DhOPxCzPmo9XmeirbLysS2RqzNuOfkvE8YgrRGfBWJo+
         4+ZwJ2N4YOpBAzlSDJHhLRm0QlLMjhFsSUTdZv7s2iMOEYiEEsjyZKfhnh5wcIthV041
         IG6YOrwePJ2wNyrsPWk88fMaw/oltBOShwlqbbR0FvciO9OSsJWNr6Lb8a1qMnwhHXwI
         yTeWS/6GVC+DFkome0FJXFg92AWHUAD83JSFGzjSFjngiln38Rq3oWh1aC+Yo8ATqiJw
         pQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        fh=yy0Apq1JAAN40gaO7EU/XVPWVchNi/Xp1pA4bR11jHY=;
        b=h9IexolYZ7bsEkfZpGWZwL0nUjDBxNIST+17017I7hAN8R7raymqIc29NVCTl1tTm/
         kampNH0zPuCMkbw12jBLj1BysVHLyVKebxxK8/WC4qTy5yoNbborwHv6hQFSachUFf1Q
         UpDbRgtUTjhO5k2epJXEgSQheAUwaxBaAOLx7fs70a0r4PXFEbSGIBAxiJN3OwMeI3HC
         1bUGiltSJRiOSRMARxsut7ajn+NVHTaoMQ7INmSSfswvPCaA5crRllxaX7+xBe0Gb5uc
         zlA2Ko2LABUk6bPFtTlyfxOoc4MZNVTFDaU1++LzN8qXYcPLbzN11yK4SJ7e6F7pQC1A
         qwSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770286330; x=1770891130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        b=HgRiR20Nx1eT4zDcPT0IeCvnAZOwhIr9aEATLZrEU+oVktGkPws+g1JwDn/BVnTPJq
         8Uq0j1gqNV6Luj8riI6y0rFImQBgKyVF4Fswj5RZhc0t+HpRIJNfHxSw1yDdFenqRYtS
         5ZPKNCTDmwZG6OF066GFAGOajcjolq/fGV9N/KGh5wGKyTSQjsPiDD5ZBPHAwy/Uc3hm
         m2ff0Py0LO4syQC1m3Oh0dWPHcPPAfIYB8xeT0tjKgPbsNA1KT7M1cjjInxPvAIhf8O1
         U6KkVu58UqCfeEf75mTc8IUQ4tFfVUkd5lz8VUYiunIVW2vgb525rNX5AexY+mvBWc6U
         jzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770286330; x=1770891130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0g/5cSIXjGo3ImCL2VsizCAIdAMiuL2cAntOyKg+ot4=;
        b=kr//PDPx29pS/eK52CXmHTlqqQr5fMPQrqSRKEJ+d8RGaSnYcGqIzkjd1XF2KUKEBw
         46pgIQ4vOCqIcOEWSAcL1u7lD6o3cIJvg1kyS46fRkdu/RhJS5t+5rWDYCt3tyAr175k
         elyMe4qPnz9bOU3skgGlvJNXBghgYHts5jAeeJXHiyKjjoOXdLVTwqCGi33+/zMq+yON
         oPAWYoRNNIFTwBgr0Dr5F7KHcl+KN/XhVHRV1ZvuZAXOLFeFDj1IhMJqQSa2axDId/zw
         CCzkSszhhePtJkKO2YBY0QVM9TyJjo73I0avsSFdVEKpzafDOqz2AdlARAbbUMtx9k4Y
         hXMA==
X-Forwarded-Encrypted: i=1; AJvYcCXTY2uLyew0zVS+BIWrG6pGaqR9mkK7b6p2vifzRx3sM09gISUfQVzyqnlMNfPYuTw4pCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvXualPAH5A8iskqKZaLGEAbLXLKNHHMS5vvSVXffw3IeKIqkM
	mVTTqtM8WQxcVJHQ5cWmC8XyF8tVyAYEz+UCtd+Ip+gIFS2+gJWnbYPF26e+ByH+Ifw8BgKiSIZ
	65U/77Ufdmg23qo770o7GnbgYasGBtOQ=
X-Gm-Gg: AZuq6aJRqrgrxmrXIzILpkCHXQKK5//U7GfZKt+1BSOAq/Z2NxCkDAfQeSeDHi4X59A
	pbqPVppWYg+qA9WkZvXRwaqqPX6pc91a14WrNrQr2Wmp0H3b9Yv/PPBbL/Jf+VYDSmc5eRKEdHj
	zz/fdYz3LxxKWkMiTilO7YxGzBIfAgTyoykYX0I97xw0SmXznI5pjKssZrhVKWndD4QTaS48Twn
	Ok4B2dGbfAUs70cnCUzePKeDxYtSyUESdrhBaIzPYT8/8UtWbsGTyqSHdYruBAkrMEaSlkRMt9f
	7xgwDOVu7W6LyWjxQRlhpF3ankEwY0xYOfEqb7NmCYJjx2ZNDrR7EtrcXJSNFD9fqymj7OHKEsL
	llKZPoiAWGA==
X-Received: by 2002:a05:7022:43a6:b0:11b:2138:4758 with SMTP id
 a92af1059eb24-126f479a420mr3236887c88.21.1770286329645; Thu, 05 Feb 2026
 02:12:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205100125.9095-1-stefano.r@variscite.com>
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Feb 2026 12:14:54 +0200
X-Gm-Features: AZwV_QjJxBdSpSEqOMEqS_vmPt7Et7QepYBy906r-rPjo4KFoR-K-6KfSW1grbY
Message-ID: <CAEnQRZDVsv8_uH5B6k-RsrQmSszGQ8OCJT=2a9AqNCq+TzP1kQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 12:03=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> The implementation follows the standard SOM + carrier board pattern
> where the SOM dtsi contains only peripherals mounted on the module,
> while carrier-specific interfaces are enabled in the board dts.
>
> Stefano Radaelli (3):
>   dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
>   arm64: dts: freescale: Add support for Variscite DART-MX91
>   arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
>  4 files changed, 973 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.d=
ts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi

LGTM for entire series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

For next series please add a changelog for each new version added so
that reviewers
can easily follow what have changed since previous version.
