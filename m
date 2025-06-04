Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6D29116E
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042508; cv=none; b=DnxMHQp9aXMzL1w9HF9CITjeIWlRHtXjFqxzPa2NpBB8d+7Bga0HtD+HoD/XsPIV5xGxLjv2Y+tf6wnQkYHMPVNZ9nie9neKdoluaI/BL0Ok6lt837oRhUmG7gnI7wQDgZ6ko0QY1bq0WhEMoAakVhpsut+55PldXbuZEwCYP6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042508; c=relaxed/simple;
	bh=IaJDoPzg8QMLk1GnLprh5fIDI9FLXNfYV4TC6NqsKEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCZ/LtnGOx0A1dzX2bVaDBStqmIPldA623wBi3E2AzjXIBYVbQPipEune9snDiOnmMND+fXFlks5YEN+74U12RoziDWLp1ODNeo1bYOLhlgAzeZuxqdyaWiGGW5812S+UrV+31/ToosJ1wN+NzQVh5bcatCLj1BcuuGsmeNd1sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVj3/XCi; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVj3/XCi"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8153867f47so2797554276.2
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749042506; x=1749647306; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=gVj3/XCi1ylywGuqGmFz4VYkMWXUE2Jv3nYct83PSD2eCITwevE3uX4GFHFRkQ2rtJ
         blQpsZvqPa1ibKGDHMdOl1T9P90C86EGPEhT47K4YRcl99KjnZGC/xgM+SPaZ4uGo649
         psZawQ5VHeM87EM9P7+m1VYqE+XeD2LfxkyVfX+0hEHFrRhgpWMG06cmiY7rsR/dAHSv
         +Mn5IE4V0jwUo7DSWC+JdxURHTEo7V2IhOgdWg0U8Hx0m3TY1NFrWHmxYeii9izPB4xs
         QGXHUcV16DbAdNWjD6sIlhwc3GiFdahv22VlIfotJwJI3OraCZylA1oQzFa5mi1VxzU4
         NBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042506; x=1749647306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC9iYEXmlPpatd1qYNBGszNIrKERHR8YSkcQ5CjfbMM=;
        b=Xs8TRq/OXFr7826VW8pN7kVYpRA90i2UQs9eVtRAi/5OL078cO3Bc6mUeKyHoX1U1g
         n7N423go4EGz+EeIBVNlKQSm2oiDzEmFJnzYBF8WWOIuw9JzdqhJgfZhBviNc6mFljX/
         yRdSo6QfzlM4YcrWQW4twBWFOWpJdceBczxzHN4XN/SXByu/Zokv2Www7gwrT28h4+Fl
         nIuoMuHNLw0vx+k7QdewEFkS38eJNtpzONIpFqvmWZwPLAl85Vw9iNdvVyVyGCnKTYag
         DZdv7KiCLJCsHNolQxShqQyrM5VDpsCF3JbxD6zLPg2HZId2VZ7E4yZxVvkv3wNGK8YQ
         +PjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNVzEveow966mSOhVhLYRSskuIhf/Eq/0JH/mfeNbTSNR9NG++GiUia0UoER/ZJd/rea8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo5SpYc+7bvmJBUohATT0hQwi8LTYO+rqL2iPNQ3XtqxemT1MN
	I7CEGpjswtXEa2xOiAa3r4CpOhva9sog5pLdtvG92PfL+ZRSaK29cR/vJ51jZvH0lW1VB+M8VRQ
	bkQ0xV2HRemMH4nLXb2PkgO0qW7TBeKI=
X-Gm-Gg: ASbGncsUalNebgXci6qTrkpKA2N7s6nTeFdYZPKtT2FOR+UzK55Bch3NCMKHiBddWRx
	T+7r5yxNoed/YC2phDimfdsam4z6LQZ1jbd9cmeEZbiW1s/OvHBY3r0e1x2oPxNjKigDgSZCtzU
	WS7C+68BxoCFruzBOZaZ5olLr40kudzw8=
X-Google-Smtp-Source: AGHT+IF7alnMbrbqO9NpYJkpsB5jxOjXxEiktzWLUbq/kLNxP6YnbLIfTtGPBT1xFbh0wT4mofPVUoUINuQKSsuFkGw=
X-Received: by 2002:a05:6902:10c1:b0:e81:7e16:aac1 with SMTP id
 3f1490d57ef6-e817e16e42bmr2304215276.35.1749042505640; Wed, 04 Jun 2025
 06:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
In-Reply-To: <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 15:08:09 +0200
X-Gm-Features: AX0GCFs1swEQiYv2NQSRcTQZ_03Yg7U17iAxPh_wyGwxwshbS1HFhm1xVLPn_sI
Message-ID: <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

To clarify more precisely: hw team told me that the required 2 ns
RGMII delays are
implemented directly in hardware inside the SOM itself, through passive delay
elements (filters) placed on the RX and TX lines. There is no reliance on PHY
strap settings or any kind of delay configuration via registers.

This means:
- The delays are fixed and cannot be changed via software.
- From the point of view of any carrier board, the interface is
already timing-compliant.

Given that, using phy-mode = "rgmii" in the DTS is intentional and
correct, since the
necessary internal delays are already guaranteed by the SOM hardware design.

Let me know if further clarification would be helpful, would it help if I add a
clarification about this in the commit message for v2?

Best regards,
Stefano

Il giorno mer 4 giu 2025 alle ore 14:01 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
>
> 61;8001;1cOn Wed, Jun 04, 2025 at 09:37:39AM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > I double-checked with our hardware team, and it turns out that all required
> > RGMII delays are already handled by the hardware on the SOM (trace
> > tuning + PHY config).
>
> What do you mean by PHY config?
>
> The four RGMII modes you can use with phy-mode are purely about the
> PCB. If you have the PHY strapped to add delays, what does not count
> for PCB, and if you are not careful, future software could reconfigure
> it.
>
>         Andrew
