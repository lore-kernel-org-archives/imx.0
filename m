Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA461F7575
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378366; cv=none; b=LyxhnX5l4U3Lvc3pViEg5S5nKp+NELhmZVCqpvmmcH8/Xmxa5+gKW0sxg51EXMagpUKQIT3kU7kYDHPs8qUiOYWn3FbFKPtgQBF80injPXB9vKi6M9Ps4MFyu7gjzayTw7m2q0C8g1HqAFJu8OFE1Kc1Z7CmYj2gtJNuNVn+aa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378366; c=relaxed/simple;
	bh=T8OPPQ63sB53cKU/lE9eCiUIlHMKwl45r6Cu0slEsfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+mqEbGYfMHbtJ7B+1WYOdPPmwcnpeS//46gyPprdGth27ZuX08aPKOUN5knSExFl91W6890PF1k2g25I24xvRwKF5OeL7NREDF0Z8K27Qf7oLVz5HErxpgZOrmdWJIPiw7oZUmZzr0oN6hrGhk8u+icxtHh+3KXqf14WGRPo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3EPJPuI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3EPJPuI"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d42884842so1670568e87.2
        for <imx@lists.linux.dev>; Fri, 11 Apr 2025 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744378363; x=1744983163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HdsNeALPBRl7TJQey6t9d/l1PV0RD8jB7VsA4lZuNc=;
        b=L3EPJPuILm0Tb3BBI4ks9kTsvxpvGp32OUqO7kyB36JQbgG694GnbArq7vvrNlom2K
         NYNdWYI2Rr2tmxflSHw5wmwe8w8xFO9Hpmfna+XxTehgpco5VyW/QS74dFewYfZYe3ow
         vfCMrIHdahj1RItrobxcQmobihqClVNfn+c2KG7icgUXwHta7dAdZJY/muqOKPZjyg9j
         cQHMRBnyk9Ok3ik3A349wOrcGShQlg8XWPz1f41ydOEJuKpk2o2kjXgqxgupc3PCF3ad
         D7NZ2eAtvCau6hyld2bLOiSSOlCttkD3MtmjcMEEySVz4K8TjCJ1IJi3vnL9QXwf8B/6
         Z7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378363; x=1744983163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HdsNeALPBRl7TJQey6t9d/l1PV0RD8jB7VsA4lZuNc=;
        b=ZjWl1xAuk6xGhWnV6k7liTByveb4Q+lN31j9mvFSJu6y4bSM1HYc7pkPgMIioNRPnk
         qwRT0YkXkRWK3wf0SW2TiC5VCvYOYShfoXujhizjbuX8Pb6P6YcZpRuUulHBLJ6TkQxD
         OjQzx9NuOeW744w8/oxboOoPoR0SojmZAvnVhSTQlj/Fs3EU61aQguYUmqgaKX4rVR/O
         AkY42iZo5GgwhFWxLXRs75UPvSA2wPgx8PjUmJUiI2HO45kICOpH2vktBdnuN4qrxHG1
         zucQJ87AT2gWzVOT73sK5yTkLGnqTiMSdiGEtZEgzdjRW9Adlod4yd2r6AFBGx3/9KVj
         Zq5A==
X-Forwarded-Encrypted: i=1; AJvYcCW2Le34pks5/gOLf2An9Hlhgeo4/AuRtS5rOjgqfmVEluJrrFS0AEXnBxgJZPuOPanfyEs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD3Lwc8eVmN2sFOVkXOlzCnLIy0h/9DIUGkpo8M941c6Xxgm1k
	QNXoS79JpfX5BhX9qXQLSGf/kAwYvvBImJuSguQ6pcApAhkmn6CJuXi+PtnNdK6zMyFNrGgCoi7
	OLicAdDK7Ve86MmoayH0pOtxzs7M=
X-Gm-Gg: ASbGncuPaX24LwSW26cXnT96pEmiiOQ9aHO3IZdinC5mWQbUWWQjufmH4xibzpxggDK
	jGKKS8d3v5oUP8PnSAe/IKCtA1irazYZPMDIGQZMpl1H6XwuNwSu0nkh+UFs0m3xie8n9S9cFcX
	IIYf99MQ1Jv3HQQKCrEz/van1fXwOVWixCzwHZppLYlCUGCpd/fgCQGA==
X-Google-Smtp-Source: AGHT+IE33NDJqid6qPgYC+c0Q5rSljAhPbuipqNwWv+AwO2kvaeyl/9m5RUa6zx/o/+6PMIcz7x+vDzf+xQLmDGeeMs=
X-Received: by 2002:a05:6512:1095:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-54d452e33e4mr939323e87.51.1744378362995; Fri, 11 Apr 2025
 06:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407145157.3626463-1-lukma@denx.de> <20250407145157.3626463-4-lukma@denx.de>
In-Reply-To: <20250407145157.3626463-4-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Apr 2025 10:32:31 -0300
X-Gm-Features: ATxdqUHrNbX-n4olVG1x03xQyfka5HcmTFZKe3_PzzPGFy-GrmPZgKlTzpzOW2Q
Message-ID: <CAOMZO5B6q06nvk3+hzbioGpcW8_JXPZGEebApTU5JZbKvMLzxA@mail.gmail.com>
Subject: Re: [net-next v4 3/5] ARM: dts: nxp: mxs: Adjust XEA board's DTS to
 support L2 switch
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Apr 7, 2025 at 11:52=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +               ethphy0: ethernet-phy@0 {
> +                       reg =3D <0>;
> +                       smsc,disable-energy-detect;
> +                       /* Both PHYs (i.e. 0,1) have the same, single GPI=
O, */
> +                       /* line to handle both, their interrupts (OR'ed) =
*/

Please fix the multi-line comment style.
