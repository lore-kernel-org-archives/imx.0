Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1231DCB17
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729164135; cv=none; b=dLp7pv6e9CKA1ICF+bFzRZR7CwEKgBEOJJwI3BG7f5TVBI6dzgu5/ALok28q0cGb4ll3Dui51nQHRSG+werrRF0urXQJXLjirxInJJfQNvJ3m8CfBrAz3cWunsatNfAUszy/sv0AhD/1tzYdPd4Fw93TpPIdu03RjagcIXFDDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729164135; c=relaxed/simple;
	bh=dg6kW0E7auxWV0POqBOWHIqceEqWu/lCqzB3gvn67SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GigL7u43p0PhDzDbwvadXHBnzDpSy+njXONPLh9OKd2WgjUihnzS5QFw69bFLKfI20zilWPu6ponmSr6I+pVra2iT/Lu4bA6XI+fUSMNWsdnfV5AEYewZnEPLVL6254t/mVb5Ab670ABuKKNfxgXQz26iPpoy3+wRK1OtmxuUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlMYDY74; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlMYDY74"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f2b95775so1056780e87.1
        for <imx@lists.linux.dev>; Thu, 17 Oct 2024 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729164130; x=1729768930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Lpg70dVZFGWL0eBVtV0mgtxSnHXtZ24Juc2ryF+tOA=;
        b=MlMYDY74y+9j48U4w+Sp1d0u++tgsbtJo708GaCD5AQu+xVbz1rwEZk/sq2WxqRif+
         pHSRW3GdAi6Aal8fOujGml/qYak7oE8CW4HueOe0fNxdFUAuDNXlZdJxpirLBUtHFeXL
         EwfhRt/g4X3WfKbcJH9W+gtd6jyCudNVQRLT67pRwnb2kSq3HtQdasIEHyYhlf8PoJj4
         G6xjIItfdui/mWwCVBJcDjOHvwG9ZLT3lvrkiK2WXzr6i2np4rNlYjmJieAbYEAggwZ3
         PCVuemjcpzWfb2bhvQ2s3IrwqO2HTehIKEOJdFsKK9ZL3XbKiFGH8pqRubkX1doF5DnQ
         QMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164130; x=1729768930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Lpg70dVZFGWL0eBVtV0mgtxSnHXtZ24Juc2ryF+tOA=;
        b=MyLaEVbkEIleYnLWctBNPlauEpymuKdFe8SR2pLolIoWNeRDveXQ126iKWuT8cdp97
         RCxfReIcfO/fUSDonWGZ+q5K4dkpZ/jkIQ9ctBKCdMDVOyR5cflRj3hXBOaREE5MxqSD
         jDyczTAlFhkT5cFN5DH856EtH7720A67GFxVHo5qChjnbyB4LLLYfLj1ZYAcvEQJkoFk
         1Ua/WjSbuGN/L/VmLnEu6eMXtSRmVMpp8vO5qEBJcf7PRb+JYuS3IloUTzl+hdxbqLds
         xTfbl19ZYBOZYo6W7Go2zWY504402NsgJsTptMXVcS82ZlsJxMbWY9i/cU05Mngh2Bpg
         1b7A==
X-Forwarded-Encrypted: i=1; AJvYcCXxH/4pNtGQJIqSzypfQSeawXWT+hYodSO2NZr8MFdyXLv5YDapiR50tyozlElQQ80J9z8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwemJIPKfQ3tPSOpo8taweE8ec3knhVQ9/O704fxLApby5uX+v8
	VzerVabNi7OnD1EaJKSQTrGXHvaNckmE/YG+8wJb04DiLg/HcxiYl23jI5fxHBg5Ldfrg5FODgW
	XxMRSy/UjL7Gb65m2PSi8xnBgACk=
X-Google-Smtp-Source: AGHT+IFmINcPbgxoJLt/7Ebjfjq3hSNSdJlHHzzYgp4XwPgYyWiLyCRbszfoBLoqzdmBxM4F5Jq7/a5nDiOmpi73fcI=
X-Received: by 2002:a05:6512:3a8f:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-539e571ce7bmr15312700e87.40.1729164129617; Thu, 17 Oct 2024
 04:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010081719.2993296-1-lukma@denx.de> <20241010081719.2993296-2-lukma@denx.de>
 <20241017103534.259584f6@wsk>
In-Reply-To: <20241017103534.259584f6@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Oct 2024 08:21:57 -0300
Message-ID: <CAOMZO5DkmU4C0YQoVwCbHTBo=DTRGcz+9K1qHY=3V29eWAfEKQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Oct 17, 2024 at 5:35=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> Stefan, do you have comments for this version?

Rob's bot reported new warnings after applying your series:

        from schema $id:
http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: panel: compatible:
['panel-dpi'] is too short
        from schema $id:
http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: panel: compatible:
['panel-dpi'] is too short
        from schema $id:
http://devicetree.org/schemas/display/panel/panel-dpi.yaml#

Please address it.
