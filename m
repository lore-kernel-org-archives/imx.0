Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C536C58F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919444; cv=pass; b=QrDX9lDcEvp4cP/fSMJ3jw96rIqMnC0laEOdEyVJkNmNPLVD4wtBYwpg04qS3sdbIUsFUd8+5j6cNax+4HIHNUdvPePv/oU0tlsW0lIF42WohTvxiedVkpueHbkZlSERLnKeKwo8o+54tBYjXmX/y4cA2YKgs7DZ1m3AHhX2S+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919444; c=relaxed/simple;
	bh=fE6xsCIR/eKT/bChDxYtjPABUURv/bY7qgn7TlNBOzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ+CDaKZ7H44yrfM06bT3zjq2Y4WOriRSrJMkLPJduC6Y1sQ217+EZM8B1Gfsmj8slLc0X7ftYPUa9Oj80NoKP8OMMSfIT02anInIQYPHWcAn134rkiwareLSBtE5dug/G3xvhch/ibdoPa+UDLVJqsu2p6A3SIo0JByyxeI0A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6m90hYv; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6m90hYv"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so4564885e87.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 04:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780919441; cv=none;
        d=google.com; s=arc-20240605;
        b=YL8qY9v0GibG+esEsFPDrxxAj2fpPCPWpnnI6ZmF3u8Fnv9ydi1O9ljnbShVMGaSmB
         ZYFotQt+N5SxasosYAD+c6d6eeJj7ynsVQwYlv+vKT0JBeUU1Mi3fnmO0jnVRVoF9hnp
         U94AptFFkLWGWjRn2s85po+W1I5YYek1iKDoGw+Vrd5ko4Le3EFjzApiX80VSii+IxOl
         Ye6vEB58m1BQtc7EkpGDugCqwIendJlmOsRC0+HCTqgjcFX2A8Z3thxfHCS3uuF9z/pX
         IYNvjhoRLEUh2rQbBT8+h7ps4v/7zNH3nOtv/dbCWJeNEbyump0+2CulIn8WBwkq5EtO
         MW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        fh=lHTP9FchkSPoijZN+UvJJlV3dorK0wffDsV+LRsV/UE=;
        b=jeIOr7KpaYDL55YHQowGWoCVCnRuiX4ni8++X9bnKfjCFgyYHD+wJ6A5QdlgFiLNFa
         FHCE1qM/KbxLSBKbA36Dpr/GK3/222K3FopmWfolH0O44uLsy/tJLBs03yg1zJynEJZL
         FddoMFPbtcmlzOmBa5UuiqOlZoUGC4iWsnZ5Nmy6SeaxNTiK/R5rE84xx6QKwnjJnVMv
         5rI6y8uTdWGIi63p0m/0FOE1mBsH/ynEkRqbKBieT1J2dsx23ETo+/j7STE4SzrdBHOg
         b74jJE06xl7EA50STKg+VwhiXQsnShrTF240hksMaeMVuMW3eVhD0w9qjksqH041OsiV
         Qm0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780919441; x=1781524241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=N6m90hYvqBzVUQDku8zcoRBPecA/aNhI4jjVmc2kN009uGkS5JUEfemxchasI3gl0y
         az/qdGi28oQqG+FEUx9Z3I/+N8kRNGTx4t64UMcGH2k/zpDcWXuR7KS0nqoB6AzKCdu5
         l9s9BEm+wAGrY64qM4PbBIgbo1x+7NGhlYkocDThUIYkAIMKuTXhbsyiV0PQ1e+0Zbwu
         i9iWhPbDgB3iNvNH0OoLDBNmCIeMoAz6OPSGy8HZPi5JLMJuv1S0Gk2VJGZw2B3CfMkX
         MYAcAEWGq0/RAzzoTSFmCKUnsJxF2n/3SInO35GxmeFtZdbyTijNvJaKAtmKgtKFo9wD
         qWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919441; x=1781524241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSww2uqXCMxSPrJjJ5xgdwSthvGPZPtrHQN2YqMCSVY=;
        b=F1z8326BPOpZF1PSr06vAlRju7TdwtlNvUi93FvPkfkfTwZ4SGClI+iU2Ekv8HKavf
         Hx0ooRIFCj4lfAE0thaR6+EfXD3gEcAO0P/9dEYuFSShD/ZlZaZiAheAvaPrqX34elok
         nO6Drm0irC0P3faV6AmRMLLYf/WpCqJ9TxSWPYdUzDDcLZHF4ZiarlZ4lQydVpOftGFV
         TOy5+lN4tQMdpcEcEfsUnT8V9peAeWPoVTGefrTqrgS603fCA9ovFmiV2ulUGaoWqDlJ
         TowerntCDgDeYdG3bi8Mmd99E+xbWdeBZXaKyLc2qjkx3rktZ//D9Gs4iVDDAeiORanD
         bNHA==
X-Forwarded-Encrypted: i=1; AFNElJ+fgksACIz9QP5QtrlXNm9Y2u/RA+xMOMQIXzqPW3CLv9dPY4wc1jC9Ucw7azxWo+2z9y0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvxdPyWdlrLZsFEizJ7vF+vExDJDv3o7xBHE+yJb63pVtWr2Zb
	UmMppDD8kw2xNZnrCDcLJvxLr9I1BX5qv+gnH8D3+WUhAYV/bMlkGtgGk8BWWhbzCgg2XvkQYZa
	MAvyoTTBGp2uIWREBN1jrJ8BSIGox0cA=
X-Gm-Gg: Acq92OH4yUcByi/mU3icP185CeZwBQ3PnrXO/1NDPPl9gw0ECeXx+RKnyfgSlAKF71V
	DjkjklV5teVlbZAjZnwKLz6wtCu86M7vMAf5Y2WN2V9GP697gDYSGh+ddaq2sKNJDrmaVycCyi5
	CQdsKeJKRe7V/JBumTzfTPU5PqQRcS28bXOX74wUK81ZFjuf4H6w8cOlvFEw2RsbSry0pvT9Dc1
	3X2qKtoAwnTdwbiUoTTp4L3v3TtQ2J6qet0L3eEDrdhATuAJ2v7us666vXm5U9SRJ3yTmR+4r8f
	HE3xwr5g7k4T635bEXq+ticLiqjHpO1ol8YL4H1xkOhwwr3+dDG9J7Re/9UYETySvQ3aRBkA0n2
	cOj9t
X-Received: by 2002:a05:6512:3f07:b0:5aa:8823:e30d with SMTP id
 2adb3069b0e04-5aa8823e38cmr3920328e87.47.1780919440875; Mon, 08 Jun 2026
 04:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1780912893.git.stefano.r@variscite.com> <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
In-Reply-To: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 8 Jun 2026 08:50:27 -0300
X-Gm-Features: AVVi8CcopUIUnSsBVn_oDWGn46ZYi_6hmaOIDxy2o6en86FExNrPt-umbKSjcr8
Message-ID: <CAOMZO5Azt+FX4z=CXHmwQTNqruKp7y0Ki2EtmDyavkuqT767QA@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second
 Ethernet port
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 7:09=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       reg_fec_phy: regulator-fec-phy {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fec-phy";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               regulator-enable-ramp-delay =3D <20000>;
> +               gpio =3D <&pca9534 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

There is no need to mark it as regulator-always-on, as reg_fec_phy has
a consumer.

Please check globally.
