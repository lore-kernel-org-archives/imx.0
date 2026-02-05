Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A32367D5
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298751; cv=pass; b=ipTe64D4s4N05jElCwhCm1f9oqzXecRhWiZSQency8oQuwTs4yUPf8WARFky1Oe2wG2Xb0K0L6+42EqwDFrwtpSzXI0DiUxmwEZnH/RNFeepTvIkpo1RoA3BgbA8NtHIIA6cGd4Fx2SbelPKh1YcjABuGRmxsZ2SC5mb96/bRBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298751; c=relaxed/simple;
	bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNmuDggs/taCRTfb5jEYUzVZR9JzApjhhMNblocjvcdIKsPlnxRe4NPFddmvHZejuTyWdIb5t+nN0SVyTc3V/bOJI9J9B2DnMMzMoXKshwNuZ6Fo+jD+Q0FBLoiEVY7kOEva4D58ZrQPFfxR0Fjtr5FP9kMFFWjSrwbupVgmAB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7mUpiyq; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7mUpiyq"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12460a7caa2so1280590c88.1
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 05:39:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770298751; cv=none;
        d=google.com; s=arc-20240605;
        b=gtZIwggz3iWYtYZWgeftMO5fTiSd1LqTwTwT5/Du+i1cYLZZ6IRPiYsNLRH8NHknib
         BU7ja1Dv49YpMAemFMZhL/OmgU34RFTlbvj9WECp/ziOYtXXLs8aNbjItiephK+/ls4g
         4v1B1+9BdFclQFXEvtbLm6X81FxdqXvcieIdwL4x4Yf3Oc3c7koe1R/BX87cxIo2tJOP
         uVPT4cLpShMwL29d1Ep3shgykJqLMnEpIo7X54mCUjbV793ii5Rn877HhXLU1bThGPc+
         kSThVhoMiNUhjbtkMF7+PZ30B5N3g7fvWPe2xpXaDpj7iFQUInRM3vezBw9jeXGvo9TV
         D+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        fh=LlompPf0bIMYQDViAVOctt0piTcYUCNDQwu8F0BucJ8=;
        b=DaFaXq6dtBAxCTg5Ye9qwJJfwCilotXQKM/Eu5bso87nbUuLx/Eb9VQ25KZUshwGwL
         BtOg5gV21Rxi5tkSKurB8tEcBFSdqt1RQZtv8Nfqzh5ehnilhXvKQ5M7mnuxtq8SDAx4
         vS4F4CPMXvEgh3JvnXDtxuZyf0CzMSLPEUeHNPlUJPO1bose7+bTd4h84v1CInEdMcTB
         CmPocV39LoSALQNl2JSpw3c+MpE6r6D/wZUtJeY0lD74iD+ReLopg3hpbUboNURBs61D
         dailD4WARvhLW4M9aXX0uB1P8AF5m1HRYkL37pgb9jbBGiatwocKTrPyvnrxnOap+aAn
         8qEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298751; x=1770903551; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        b=d7mUpiyq5j01hECW20vdpNd5TtzOJny84JNPlZguNNalOCemOHqVTo4HltochFMs/6
         4WHvJfZC/9g2TJSezQMV9cKQGZAJoYGoNPxMO/B1kmZ8rlqzmYUlZzSt4ixkpJKkBlLm
         9QO7/rIMH5+kxMezHRivz7suAjPKU9TMfseWW3L7OKJdnNU7HmZOYWhIcUNHA9qx5Dz4
         OQ2aZOySKz/icGsS+mnIeIKjwzNT58fY+fDR5Fe1RQJlG00FxXlY2jHiQz5ti+xNjEK/
         hnYZqTSqedP3yaQpz2iXpyLS61feT9MT2/OiJbgEn/gPxG24LU4ciQ1MMoTJjbif+fK/
         4Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298751; x=1770903551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        b=T3ZUwtOGvo9Wnx6ukkuL8eZeFy+hc7lb+eERUjZvx6fT//8nz6eEkOzT30oI6Oqw85
         TL2jDtIcctYjRTXBHkDUnztgT1o8P/DzvMByS8g3WMEdp8Y8WZgRgJjRH1Nvs68vtdzA
         7Kmh5dRR1kxWSKPfvf8wyQs4B5HN8c+I649zYj816H5Ggh00zJWuwb5jtZfWBTkHITgp
         CK/SR7lL1qed2JfcWAYM9LispKeNTwvq3ctvinjM+0xlm7yNkWzA4Mca3trE1058zp3R
         adb0V7bVeCuCP6+JgTCa78FyqyKVKXyekVB03mQEJi4YMhiVZeXeksc6UzyrPr+D0Nhq
         4Oyg==
X-Forwarded-Encrypted: i=1; AJvYcCUBPHFiCSjy4GwIRuiGzinhCqnt5m7E7szPmcNeQv8jdpmJ2ow3uZCyyuFFLy03UoAkbjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNc2Gd9SeXqi64MU/UiamyRJE9RymKyRb2qDGko1Mnpe6tjMAm
	5eeTgmgUR+PV6nDVeRjio+5xh/droGax3XV3Np0GSORLO5iUVD7P+aFSDkiitmCdaGDvL8HJtlY
	FAO5ljPXiX8/6bdvPKkUAPdgxb76bRCU=
X-Gm-Gg: AZuq6aK56xIqRd8gAiKgpj1EzhwusaXHY6lCroD9rhl31ImnQpqwKRXkz4HVoiuptPw
	BgFLYKusD6YZXq7bKOAwZejK7wJ1RsOdpBDtfwhGnwKlfJQRHh2Hp7ArxDGysWHYojW718jamfu
	oqRd27zwSX5PFFM74KdDOBx2bTE2YKnaSZG/YJ0F6mbw75veOMLQWtSC3BGY4nZ92/klGYGsBH4
	9lBn98ZVjzsF8IEShxgnFZZgWmzVqvgJQ60MD4xr756BB/HNMeD1EMvAFImlSxLohGViS3XhQ3w
	j/+ovIpPTd9R5uoVBSIrNywBrSswqsC1lQlehWP7T2043f7h0XqBe9aWx3NvkmAUPFvVy3hec5B
	TguqgpVh5/A==
X-Received: by 2002:a05:7022:a94:b0:123:3364:2cad with SMTP id
 a92af1059eb24-126f47df434mr2985042c88.40.1770298750680; Thu, 05 Feb 2026
 05:39:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
In-Reply-To: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Feb 2026 15:41:57 +0200
X-Gm-Features: AZwV_QjtTDQuyjSNcHW5ldGYp4M24kdWeqjPp9n9pJY2oppr5gGyiiOIFo49TGU
Message-ID: <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 8:43=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimize=
d
> variant of FRDM-IMX91 and differs in several hardware aspects:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> This patch has been tested on FRDM-IMX91S board and verified for basic
> functionality.
>
> For more details about the FRDM-IMX91S board, see:
> https://www.nxp.com/design/design-center/development-boards-and-designs/F=
RDM-IMX91S


Hi Yanan,

Just got my imx91S frdm board and tried to test this but the patches
failed to apply on linux-next.

Can you please try rebase and resend?

Thanks,
Daniel.
