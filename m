Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900D4AA1CD
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375065; cv=none; b=c5hSAH7oHzzS2yxEI/dHRivkKob08uUy3o2QW752jeqB7kKAi99El5fivWlnWaIWVcX1ZVTGBTSSWJWPX8O1EjT0lfQErQmS9fwg7gWnlpE0IC3Aa2VCDKWjmaSsPIOOjrrs71ybc3d3BcfFgOPEzMOJpCXZ96ZlvzhKZXKW4Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375065; c=relaxed/simple;
	bh=ztti2r+fzKNtBYjDvDyqLKSRA+anQWIh+N2I4s57yUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=oaeRkeORwkSmOzMBSxjn5fqw1V4b9tVEoMzZoyfa/yosKBZFoSDpmE2ZWS10zq9egZxKizObEvkLOjXjp202M6hu4rkrvyoOrSEOuZhL3JOb4tX/enTIgSxH1JJpaWzeVnahWXZjMa9Igg8UQxzUSuGu1kDoDqeRbFSu9UeoWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=I6bZnjMv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="I6bZnjMv"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c25ee9d1264so49061366b.3
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1788375061; x=1788979861; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rto/zkmddcXFKDuBMT5owfeFn2l4lHjmJnj+jxGDxQo=;
        b=I6bZnjMvTPBM4g6XpbKfhIPTVzB9Aic/5JwhoQrQPFDJgV6BllZj5MhY5agsPxh7Io
         2wyARKjSdO+oeDJ8NtBci5gWdiI7kfqmgmH6OvLS9fs6ma4QzhvhteGN7Mcu61VwhCpj
         YKDNeqL+aMYucAAsOISh1vcTJQe8ftScyB7Memws6e8hT2ayme+gTqNW3bJLSIB/CQA4
         Y9t7GIKL7kX8UPrX2+fIw83QuG8NDb4FgGJcF80v2Myg0Egfj/KephVJ/KLSZhH1EU7v
         XRDq5UbDI7I41jIPIR1g0bQB9a1HTcerjUqlluUc2LDo5cd3YHDq9d/vjUlK9J8quvSf
         W07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375061; x=1788979861;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rto/zkmddcXFKDuBMT5owfeFn2l4lHjmJnj+jxGDxQo=;
        b=As8SSGZ8fL/L3AwC9ZQ1xFml/3bodJbw0toAUu9pcVwhrVRkwwbYgd4seSUVowP3Hl
         ZCXlqmVyCuu206/WbJRhorzUgXu/dvM7qGtL2KDYBolOF1qBT3HSNuC8mEd/hkwjSLii
         plf37K/tdyYvzMBOfBVp5b5bcdq6uZEv0l8c58nYPLHGdmNqqQZLGUljWoWMwid++edi
         0vVcNEtNFswZBdeJYDgQp3Xrqh/QSAmzzBGDI+3hB+MRMJDp0Vze6flSctAOEyYfB5Mt
         Ws8VtiYRYvSTPR0BCtDE0D6AipnSCXmtKtfc311a0RY/DcxomSOkkuBadCJ2odvG5U8G
         uf9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnoOLfWlF/HqZOD6EbwMKiocq0PDk3CiF/+53tq7hHSneV/JSfJNPYPSI63fuVVpwlVS0=@lists.linux.dev
X-Gm-Message-State: AFuF++lMnwpvt/+6Wz5qVkREynQFEOd5KTvKOpn+aBt9hflzvj5m3q0Z
	KqQ/2LfA2CVari7ZG3iOAinIrDWWwHsDkIME6bqlBpzV0Hi7HAyeOdAMBu2eirAWEg==
X-Gm-Gg: AYBFou2F17AJKkFMDT7UupJBLH7dCuGRqWB4KFBt+Kc1adZXRDYcfjVVVJq2uEns1Yg
	mf8OxR1DYXploM/HELbimClOyJTh3Aqdvj80lysTqffX6fw96P3C0uPscN8S1AhZfMudnYqsqUU
	W+SpISiQaibyk1APAN59u19Xv9j5nZrtSh3I5aztfGox/3v8HHBrlM+Js91XdShKoJ/p1qx5+g0
	KflJd3LkpAWTFtI/bnsh4fHJKKtVD14WN+s7IH0WRTUNkmNCo2vZgpcetgh74FMdUHGy657uNJl
	Srk9Mr/oDpgPuKw4pgOORc8iN+ABdBd4pOsslG11YclLNMwLzZ9MGMssF40vcuANFgwRnpM1U9y
	/d+2uTiB7htfZ/yPduaHZxpufntIjvh1/PTW3C/97GBwpQD5MA5Scl4TuecgAlnDr00x63xg7lm
	qdqdjlFqEG9oqUaPVKau1N2L7Dky9QpPObsbS4f2f/RptD9Tx5Be6jvTJ2xI5NBOwfOU/K7XZdg
	J8juJuTnBQmPB8wTmRjsHh8pWV2HQ==
X-Received: by 2002:a17:907:805:b0:c25:895c:62dc with SMTP id a640c23a62f3a-c25d5496a24mr425850266b.14.1788375060906;
        Wed, 02 Sep 2026 11:51:00 -0700 (PDT)
Received: from localhost (5073F89B.static.ziggozakelijk.nl. [80.115.248.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172e44sm200366b.20.2026.09.02.11.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 20:50:59 +0200
Message-Id: <DL521SM75B0T.1DGK1GVSH1G51@9elements.com>
Subject: Re: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Richard Zhu"
 <hongxing.zhu@nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
Cc: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
 <178835947957.88571.7553170178358028044.b4-ty@b4>
 <gayg4xafgxcog7f7jy2i2e3wctds3do2ytttgv74f3y6ed7qtg@mr3xfxugjfeh>
In-Reply-To: <gayg4xafgxcog7f7jy2i2e3wctds3do2ytttgv74f3y6ed7qtg@mr3xfxugjfeh>

On Wed Sep 2, 2026 at 5:36 PM CEST, Manivannan Sadhasivam wrote:
> On Wed, Sep 02, 2026 at 04:31:19PM +0200, Manivannan Sadhasivam wrote:
>>=20
>> On Thu, 27 Aug 2026 18:51:00 +0200, Michal Gorlas wrote:
>> > Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
>> > states for devicetree platforms"), ASPM states are force enabled
>> > on all devicetree platforms. This causes PCI devices on some i.MX SoCs
>> > (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
>> > though CLKREQ# is not supported (and consequently supports-clkreq is
>> > not set in pcie controller node of their DT), which causes the device =
to
>> > never wake up from L1.
>> >=20
>> > [...]
>>=20
>> Applied, thanks!
>>=20
>> [1/1] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
>>       commit: 94420d27973f567e5c10b631115ea8b9abc0172e
>>=20
>
> I dropped this patch now as I completely missed that this patch incorrect=
ly
> assumed that ASPM L1 is controlled by the 'supports-clkreq' property. Thi=
s
> property is supposed to be used only for ASPM L1ss where REFCLK would be =
cut
> off.
>
> As Krishna explained in v3 [1], you should use 'aspm,no-l1' property in D=
T and
> use it to disable ASPM L1.

Right, 'aspm,no-l1' solves the issue I had. Also forgot to answer
to Krishna's remark in v3 thread. Sorry.

Best,
Michal

>
> - Mani
>
> [1] https://lore.kernel.org/linux-pci/aabc3dbd-3e5b-4272-807f-f0743606e25=
a@oss.qualcomm.com/
