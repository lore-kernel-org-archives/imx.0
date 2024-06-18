Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408EDF6C
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718676423; cv=none; b=bCaBlBFB722I1bBWWyo4rVlBY17Caq/gnleMbypJdSyfdU235FGM3cMj6Ta7wFV1+0fgoE8s5HlHM+Md0zHDUmJBYlx+HxR6Gl1dgxZRPnQCAs2XbWEYrGL2sFnu7Le/12an3gCJk2EUrvv82t+X4oHBVK+aSM284Hi1Rx6Pk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718676423; c=relaxed/simple;
	bh=tDDhJBx2kQ1aLSfqQqgYyhSVtBWlyuSbl2KCKioVHGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWZtdURztU3FBjmsdN8hE/5tIw52jF6JAvpTem9Dzk0EbeIOWqz+KqLB6/982OKnLECsiVWob4ACqOdhPv1dgBCGwZ8ZTLgl908s2pvPzqvo+aYcrfdDDtAvHFBDVrONXFo/hv5b5EpjemVdZOhimdtLV1xYflABe+y4jrX7mEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHri6Dau; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHri6Dau"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c2d2534c51so938559a91.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 19:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718676422; x=1719281222; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHBxFQeQWiychYaWcoZDG4DV0SlUdCq7PLvbbl4B7kM=;
        b=NHri6DautcDMvy74oPZpP5Sx5UhkZkeEKQf8n2xk/YCXqr69mkN6N/Zc4nyjSa51Pl
         f8d2vYQIxtKA6ULlpu6X2X6C5WEueSxQdrSL9ToaHOzImqEWXxJ6gqEO3Nyf+4DWc1OP
         ZSWggFdRbV3O5S9YniSQmUwLfpGgFAkzFr6WGsG50REkG3bhKE+6aRHidiCyEof90JLl
         4iCNGJa0yQTyNWgr/fFU7ZR6ao75vOzwhGv1m16CbyJXWOCG0dQJwYSzWGqOEnr+Olf/
         jDjJfrjDczNGGnnKtjRf2G/F0kMz8PsDtFq1FVSazEXzuHROBbt3/mw04n8ckbFok9TG
         LjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718676422; x=1719281222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHBxFQeQWiychYaWcoZDG4DV0SlUdCq7PLvbbl4B7kM=;
        b=V78/22yyjdZT9iOPh+h1urPAO5+PZCJjy428WNy6IdiFm0/Zi3WtQKqAMV57HLGrpv
         Ialmw0DPCVhuZOnLb0wyfDEKxQhoej0Ah34Q6Zuov0nqDzJNE8r5ubpkIqi3igvozx3a
         gFwmsNUsQydsakS5IbKnwmj7bxBmjyq/92YsnD5NDc5LzWFChjEOHG49knn2L3X19aGl
         8qyZL86RhPxsWb4fxmxgE2Jp/IC9zTCw/N8Ue0JV39IH0spwQHnAAOb/yEVB7RZb4Szl
         A+X+tJCRfjONNCLfvRwh4PnpYgc3S7D84WilsvktRZVWVTitK7bsn829yfUSrMut7JTf
         zcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7w21JXbuTfoyk8u+Zr3edockI9EUoGKV5nZS2DwMUhb321EQ5lQXrSPABDMgRqHpAg0jVAL4jCh/w8Z08Bvkx0jSH
X-Gm-Message-State: AOJu0YzTgGkq+QyIsj2LNsiKSxSrr6aND3rKKZ5ojvEI+3KTuLi4wA0R
	wzP/sa5cN58FI3hrB+N82MT3SeZ8DUDCHUUAFx2TQ/074jDUs69+vhVjTVUP12IPyk7EFgFFBhn
	2IvvPwGnWHgpSut+wb7KFJfRfWMo=
X-Google-Smtp-Source: AGHT+IHXFbCfgwFRqQQzynC26fl0SQoMru8/nbeWeM4xylrZ+LYezcIbS61zdeadnIVSbaoyw+wsp5+0qpHN/34+nqo=
X-Received: by 2002:a05:6a20:1584:b0:1af:cefe:dba3 with SMTP id
 adf61e73a8af0-1bae7b3d2c7mr13813299637.0.1718676421778; Mon, 17 Jun 2024
 19:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617223100.1539796-1-Frank.Li@nxp.com> <20240617223100.1539796-4-Frank.Li@nxp.com>
In-Reply-To: <20240617223100.1539796-4-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jun 2024 23:06:50 -0300
Message-ID: <CAOMZO5Ck6iME0d4X3fV=wyO2Y6GvX1-=EtxWo7TGLRZjFpABFg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx95-19x19-evk: add PCIe[0,1] support
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 7:31=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       reg_pcie0: regulator-pcie {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "PCIE_WLAN_EN";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&reg_m2_pwr>;
> +               gpio =3D <&i2c7_pcal6524 6 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

As this regulator has a consumer, 'regulator-always-on' can be removed.

> +       };
> +
> +       reg_slot_pwr: regulator-slot-pwr {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "PCIe slot-power";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               gpio =3D <&i2c7_pcal6524 14 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               regulator-always-on;

Ditto.
