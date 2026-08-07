Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688A4749F0
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114801; cv=pass; b=hpA82h2GEfdszvT0gNtF2O0X2gakujm2bAeAPI8gfgh9D9ryH3N3rJjDQh66cT8Hk8w5F0oBH2qqjDpc3r+DNUAlS4wNvIMZe4FuRIVrAd02isnjpy0Rawi48iRQOw0HaZaCrXwARmjVCZ+yj9Rcr0KNtqIZkHWVDhMQjNGJLMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114801; c=relaxed/simple;
	bh=gV20Qq1q8KHAEqMNSgw5mTDYx8Xl3nfNz4w7UDZshT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3YSGbsmcpQzISkUrASYXhUKBLTCnYapL64uvi5a3R6jJoETl5iikzlfnOkF2BzrNRURwzbxCOo4r4ZXLz2Q0EhXpkgEZQ+yPNzZhLwa+RWVhdGn8hThg4z1ZqVpiYaZcvIZ5+8EJ4hVTQ1+z7HR8686RY0QHa5MyFSXtxAM0TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cl11XQAi; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cl11XQAi"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977168e4f3dso2207315241.0
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786114799; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4IObgYRziy5AqDUrSTIkjaRCfPyeSLESc9WNgk0ThQmhHC7xCNDmDvjbzdfuSuFMj
         QBA59OlsGIR3fRaH11Max2LQ5aW5hBrHT65DJfDQe6JPvuy+DDcJSFDe4ooMDNlLOLL/
         GHi5IZ0qtu0bXIHKX2+ue7yUobePLkJ+BPY+GJ4jRKO0g+Q81ExDOgBG0vNRkLq7a97A
         bSuemvyL9dcsgurc4FKAc010TKlniXYEyGmZ3zPI07h/nsu4cO7Fzjt2Cb357HgcEJTX
         FeLq70BWJI3IEUUZk3YLIUY1sxr/SAgZOmefxzWOdme89RS0tP5UVHI7lyj1iKa1mfRJ
         RrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        fh=tnPPVLUM7aDUhRjTYULv2n4Z8TCgQ1t/Fj7xxivFE+Y=;
        b=OM5YXViEXjk3qo4Q6jPu3jF63JDRCJEuUoLbR3xgjD6PGPibNTg4kJVUikJF1lKkbo
         1uKyXoRiqVd62WJ2gevwIHMGr2v1Zxg6IjyItSXHHOlovRvhnBOAPrG8B3BcOVD85Glz
         cx7feGvQSNnN4U71Ovuqc7E2vJu4yE8ZVF6ZHmZc2lLi+N1kbsQxIifqA5D2qcriHUmK
         Dw3nC+y2eZlEYqeDpwRKAtzE28nDaeyUJwGS6/t3aFd37DoGhvBpcN7M4utD3YFnuutZ
         Hl8l1fEvc55xo9lbnEsi4c4Txt8TMk91aYpbBpJwjdihc0gFS230Yrt2HvVQk/ZEtqod
         xu8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786114799; x=1786719599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=cl11XQAiVlvJWHOqqkDRmXwYRLKTJ5tA1yGUYqR4pY4U+GaU+3tv3Of6vRlocSIHd7
         SiClj3Cy7fajWRczuDEYBQh9fLjMnzfijWYFnB0d31KJT58LMWexDEEjRXnUwreYIAUk
         SBJAVzu1pn7ov8hS6G0mdxoeR94jf2vPn8u/dTXDPR5KJgTv7KfBuaEe5xIXvFwaJoaO
         sblQGjiFr5UV6j1S3tpFQ//PXvbBLzrK8PcEwLpBiJaF+BdxxpLSrTcKoJ47QTEvxi3+
         9guMkpM0XbxWdP7/0wwMRQDNceceJaRf5r+q1NW/g8pOzk0fzIL5ggitNNtzDzE5XbUL
         v41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786114799; x=1786719599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvuSwihRV3vLoITfKBXt24sePvRgdmUhr3+yUrenF18=;
        b=qJCoR24yhtmJokudHcqjn3ttgW8Qz5oQY0FQ90/g48ulFHi5A0MTa9UqLgQ+fVn6JE
         XXUn0JYElEd0iSP/BhqAMqrOM8OUov8H8OHMbMmL3zcHM4N4XX6mb5SDfAw9XaDFnhfE
         0QfIYsL7G6cLXv7mRPXJ4JsiMwrehN1Nfxs9oQJ/yW7YB/NkkyokqmAhaLv76DLx7Hnx
         aHWBL/TFGep4HiPPF7MwBz1n2yILvxV7X5s1zMHekhze3S/d5rCAyk5hXz5UssJl65bK
         E1LY0jBjOuQBFmNukwR/eWNxfeBXsrNp61OfHP62Iev5EI2bzYz5Idcdgmcwn4dHDrir
         oysA==
X-Forwarded-Encrypted: i=1; AHgh+Rp54A5yusORQsHSYxfyGXk1a+raAI/FCSGTjE7KcAT2Dicdz9+/7uLzUuB28j4L9pcwFwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxayrtdMOVZGSxFzJO3C1JMulqrTnX3m/Qm2OTYK7967c01zDT4
	idhhzmy77fgQwIWb1ebJJS8CiVvJQfPkM3+l4p8aY0RmKuRQjuq7DUd5X2KRNrH9tAyrNpJErRr
	cpSoBIvJT1Wk+XKfR6zHrKrNnVvjdFYE=
X-Gm-Gg: AR+sD106BgHLTP7cAgSGW/68Li1xwvXEqrgKUpImih1R0xHJTTejmwPRsvux4pQjcs2
	LYcKlHYCNeCpYwRhuxLlecTo9Yl9QeDcwBcuGEOyQdK3H30/DhB5egAvJVNbSMQ0lH5Zcw6u1Cf
	buOKBxJtGTJt7nZ3s5Mjp19EX5rqXcHpETjHmGfdvUCisaYxJyibDr+hb1SI+N9PcRiFj7j6uDr
	m+s/EqPDkGOORX4ovSF5LLyQh5KjFIo0nleH8qzzWM7q8kSIhNj83aw9Ixp9iRiSt73Xp/2hsI7
	DyqGo2gzYuJ/llWN2gKyU42jRc1NCsV4ESP6dT5zsfnD56NERDMPh8PzpGwZO4DiR913trAqRl+
	9z0p/EepQZX670+wdI18HZZao0kk7jhyS5DclRMGnf1IbdO3C/VmOv/PTBPswgabjeAsuBtUskH
	ggCryvr0i/TVIDtoIKnqWM4hhHD9C7eH3VT1n5
X-Received: by 2002:a05:6102:54ac:b0:738:bf0f:d0c6 with SMTP id
 ada2fe7eead31-760e3b9ab74mr7413161137.0.1786114798682; Fri, 07 Aug 2026
 07:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com> <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
In-Reply-To: <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 08:59:47 -0600
X-Gm-Features: AUfX_mzMI4rGrSWJxil0rkCdGHQcdQSp5kYsnGxukt-NVGzxhhYkib-rvufG5PE
Message-ID: <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:16=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Aug 06, 2026 at 09:54:19PM -0600, James Hilliard wrote:
> > MDIO buses enumerate firmware children only when the bus is registered.=
 A
> > later devicetree overlay or status transition is ignored, unlike on I2C=
 and
> > SPI buses. Supporting live reconfiguration also means that population a=
nd
> > removal can race address scanning, PHY attachment and bus teardown.
>
> Please make the bootloader work around the issues, and drop this
> patchset.

This is just fixing OF_DYNAMIC for mdio now, it's no longer used
by the AC200/AC300 PHY patches anymore.

>
>         Andrew
