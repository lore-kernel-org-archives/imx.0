Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850761D7E3E
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730884817; cv=none; b=K5YqbZ0owHK8o+HTsGPaYFnc4LfWbP1tt3OlszXKOb5Jv4j0i7lyKlf/luVNc6E2s1bsY30hmbrQrzcUhfvVHjjidOdAu3aTO7O3vdkPcYFjZpSi+ACvjP3RZFlpP5eCEjxejg6obOjLlof1KKhfGQUgVx2GiAVjybmPKv68nLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730884817; c=relaxed/simple;
	bh=NICnhTyDeFjw5xDNNJO75dAzGin9vebw41liMa/LWfQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FNKiG65SHGPfkXJ9R3PAyMO9bLFbytbSsryjx3z83NWrxYgtEcu39dE/SKKPjVhoGYBFDYQ33JULLzF1d+ir7NZitvSqrfLTSAm1J8c2jBXUXMQCytABSfhx+TW1Wt1iTGexX+AyDoLt+DaJr8JpzEFYKO3qNdY9h1zgMP2JaQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fu49QI6/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fu49QI6/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso50631155e9.1
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730884814; x=1731489614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
        b=fu49QI6/SspYPQe/+JjP6l2Tz9Dt15VeeI73NPKp0+2Xz3U8gd6YFJO7KfIQqQr8FC
         aQtit5YZluXBDgNXlVwIPhxIXoxKX9j/bwNMF5K9kPGxcNyuSiUTYMrbD6cIodPnWj9c
         czURth/4KAa9wLktH8T0VQWQahZY/2+/oKQ36RFjupYarw2f23uwoHmaoFquAflQK3b+
         I6Q7pMw00NJObn/4tiihRngPUbZpJM9xYhMao1g54JEnnEWoUlPrSHC5smUXQdc7fkry
         cPrerhOn1ym7ghCLye6Xzm9dHzTnjfA6SKJ/rSLcRTyIz1ZhQGK2kRsXcJfGP3sQZYSq
         EVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730884814; x=1731489614;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFpPn0d2yFLk+e22ei9wc3wv5WH7ZWHa4AxPfroJzYQ=;
        b=ixlspS8aWbYqY75LI1rX2U2cnkg3EmTt3JvROUXexexI3Q32W0Wnk93sMMrgFbboko
         nmMlIOE/Vh1bncfNnbgvlWIWyy1/MRaIPLWrW7oJzbC6wRgzJw6+95z7wKCiJuJ4EjCo
         JHcS7cvx3opQEuUBrNLNpFEENkKaD7K1Q+e66wKXxq9GVLAIGLWJoOZ0++QXo/mm0IRH
         cupKQuhZjlHZ7+VfNZKziL41w0a11a1uktQarCGZRmDQadI7N5EW94S8WGSeWW6kC4kl
         mVswc7M1uasYbLwbG44VupZyKXQmuCeLfuwBksecAPppF1vHcc9QFSlfdfXhZUQuN0rw
         PQAw==
X-Forwarded-Encrypted: i=1; AJvYcCXM8EawkhLwYs6F7Wy8fLLlYxhoUhxRa3aeKz5e7/WOtlMFPPWZm6b/Bbms7/ByQ+lpXmI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGazYSrgzUpxOOPOck2z7by/QrPS2+WI93fxLVhnkGmtpSsj5I
	N5RU6IC1rT9Ep7p8Pdb5/K7Lykh59s1y5a+CZ1mN/4fWYmZOoug1dFDlh4pEU7Y=
X-Google-Smtp-Source: AGHT+IEYpLtbvoq+DLNXwR3nRAmR6avtTq4h+YsWpETFhBlqaeNqXWJjhte4lroosj4mGd9kd6ILbg==
X-Received: by 2002:a05:600c:4fd3:b0:431:60d0:9088 with SMTP id 5b1f17b1804b1-4319ac9acedmr359810715e9.13.1730884813855;
        Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Received: from [127.0.0.1] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6da939sm15286495e9.31.2024.11.06.01.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 01:20:13 -0800 (PST)
Date: Wed, 06 Nov 2024 09:20:12 +0000
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: =?US-ASCII?Q?Re=3A_=28subset=29_=5BPATCH_v5_00/13=5D_Add_ITE?=
 =?US-ASCII?Q?_IT6263_LVDS_to_HDMI_converter_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20241105-succinct-pygmy-dingo-4db79c@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com> <173080602214.231309.12977765173766280536.b4-ty@linaro.org> <20241105-secret-seriema-of-anger-7acfdf@houat> <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org> <20241105-succinct-pygmy-dingo-4db79c@houat>
Message-ID: <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5 November 2024 17:39:40 GMT, Maxime Ripard <mripard@kernel=2Eorg> wrote=
:
>On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
>> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel=2Eorg> w=
rote:
>> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
>> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
>> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> >> > i=2EMX8MP EVK=2E  Combined with LVDS receiver and HDMI 1=2E4a tran=
smitter,
>> >> > the IT6263 supports LVDS input and HDMI 1=2E4 output by conversion
>> >> > function=2E  IT6263 product link can be found at [1]=2E
>> >> >=20
>> >> > Patch 1 is a preparation patch to allow display mode of an existin=
g
>> >> > panel to pass the added mode validation logic in patch 3=2E
>> >> >=20
>> >> > [=2E=2E=2E]
>> >>=20
>> >> Applied to drm-misc-next, thanks!
>> >>=20
>> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
>> >
>> >Where's the immutable branch Laurent asked for?
>>=20
>> The patch set has been picked up after getting an Ack from Sakari,
>> before Laurent's email=2E I am sorry if I rushed it in=2E
>
>I mean, this was less than a day after you've asked that question
>yourself=2E Waiting less than a day for a mail to be answered seems a bit
>short, especially when there's no rush to merge these patches in the
>first place=2E

Point noted=2E I should have been more patient=2E As a lame excuse I could=
 point out that the patch has been up for review / comments for quite a whi=
le, etc, etc, but this is really lame=2E=20



>
>Maxime

