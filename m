Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA531F4E39
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495679; cv=none; b=Zu7VTet0S08apq+VrD7qQBdwEJ9Ux5eNBryA7qeUwPr/ld35m1HuJg/J+OU0InJ1d9TvnujgTBydAqDgdMecOt0EXRQVfBOhKZhCNzAtwRFNkPpJPWorw/hlD5lwklve1+LKMzhdPIZQhfVkwEw8+QuZKXwQQND5cCSVcSU/+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495679; c=relaxed/simple;
	bh=2LfjVBYMaapqG+RGUDzyZUCD3VsHLRQTARBAX5EftSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrDgPLEq56KbU4PHbs7YCGHEj7HwJuXheb3RUluSnssed1/ixjy3jA8TyA7pc5DSPg1RPf+HwX6UKnTER891pVkT6zscNiifdTU0x2khtTC+VnM+73GhMbt5P1lpX9cqg5sK0eOaWWstxNmVPxHKWu1CRmGBVi3xvnuWa19aM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBLptd+S; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBLptd+S"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22423adf751so9316515ad.2
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495678; x=1746100478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=gBLptd+S1TzFDH6F/eN+Mn20BivfpiyYNEEb8POiwSocI1hJ/Agq/sDH6lKzWK2uYV
         e2UTSFokfGK00x0UMWqjsVXo9cJkHRjWQ/IR75vf8z43rEF7wNmTyO6IyFOw7E5HBmge
         s+v6+oqMdf5BMLbZ3dz7HRiT5gINNB5dyZ9TH8HVBXLI1XwgER9l37yfpL+twIGfaBy3
         Gbb/d+Kn8Blq6DraomomKFsof+RuOsZeZJwMG4ox2uZjobEQchp7BwwlS0iER+K2TI7Q
         9WU6LHXsPv593LUbsBcVBp5v7wuFLIE38mGjbsmmCpPXjD5gEYg2Mt//uIhThjeDbt/H
         SlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495678; x=1746100478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=KtbTwd5gbzUjfvjhT0z8YLgJoncydIpD/LmPrcMgDWkEPGK9A5EP/J98KSoS3Gk2k0
         zB5fUgYrl8A6/lsNuADhllQUScSj3O2yHCnx7UYjahQlh6UFwvCgWB0WgJh5G5fjwGJ2
         HX8lmHHpE6I5lg5Qtj5ojkRCH9r+7ajZS+oOSDzpv1boFpN2Zzf+eVJIOW+l6LKYX+U5
         27ZP1sJc35O6iyq2a03LkxuTYIqtsB69Qgmx9rC3lt9FBaDh6Ouq117Dg2t/dHvE5DOW
         o4FLpBe+bhgINw8UTC8q3SqVZcdF6RXqcZpelKV6f9xSAZU9MCUcbr+/pg++YX5cb1K5
         KKwA==
X-Forwarded-Encrypted: i=1; AJvYcCXGK2VZd3RnYwjd2pXhk9f/xsy3GSADMXeZ5LWjHke2vNTlRurCcBIJoVsFHZ9POk8b6dM=@lists.linux.dev
X-Gm-Message-State: AOJu0YylYfvlesuYcgC4tgw5VgQn613qTLr6+8akFqx/GwvOk0pfg+MB
	Mo87n0811Bo/IleGtKLzGyiS1ir+SZCfmKKQMGHIVjRFDZtBs4eb8HACzvvSlPizlYCVj026ehI
	fp4k4QH7mNDaagf3ozO1FwalODeg=
X-Gm-Gg: ASbGnct6njKSDl12QH+WuYGIKPZCrJ6vGuTBgkFwjBJODD6rsnStoEA5srszj7Ii3AX
	zJ7C8/2OVj3+wVxRcDASd10DeMYleaIovZacSh/Jk3oy01UNDPtTakFcY5dVNddtlGxuRJBT+se
	h1vCjkNA2o1YKUEO9GtA==
X-Google-Smtp-Source: AGHT+IEwa/y2fOKiJtPJOHNNBAcDhjfvq/eByFcVBE+2/Yf64GYFD5P4bbwNs4WymJaSgMNAyONJWmAiuB1qSHp44q0=
X-Received: by 2002:a17:903:2a83:b0:227:e980:9190 with SMTP id
 d9443c01a7336-22db3dc0b8bmr41057205ad.44.1745495677805; Thu, 24 Apr 2025
 04:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:28 +0300
X-Gm-Features: ATxdqUHiE5YmwRp_Og4qSAkF2P9kcgp5oyollWnIMyXy-GIrHjsW43cM8hbn2Gw
Message-ID: <CAEnQRZDjKpUDgj5FwxGT-vK8WNGqdtf0JXoebsYqCYbWkOnUww@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not m=
atch '^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
