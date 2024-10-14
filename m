Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CD155CBF
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894679; cv=none; b=hDmvi5Em5AI6xAtQ9n/4lkTqrd3QndMoZTb1jgPVJUZJTVlrIP8Sce0cUh+cAqGtv5SWLF8I1rgDIzpF4CKCXCc/ahk+0d/lLCN6jjOmrfe47/u1Z/t6EL0NFceLrmJ9SuK4sMWiEA0y3KS1DaQM2pr9eR7SYTIL60+uZOC4MdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894679; c=relaxed/simple;
	bh=Fv+iKDGnubuClZOy0sgzuUSOaRDVqKI+AzPFvb16xxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lob6PBKZIagJfpBlVqyJPCaUC10o5w+h8MCn95Hr2DY3yqK6ROGP8i/NTk7GyHRWfZpyBu2AsE24ARUnGIsFkG76K6BsaHe99PAjuJ1gsGekA4zV/APTUuHT/2LUUyOLKMzcviTFawNcFlWF8b8AqzkbT5XFl+/E2hVXVA7jYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDxHrdpo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDxHrdpo"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so3550831a12.2
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728894676; x=1729499476; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVYpiwMgp/0jaR9U+wh+xTtNu0fqPqTVzNP6AS7gd9Q=;
        b=aDxHrdpoRopPZAQGokTGNO+qwcw47ntHB10jQXxAVyPuVP1tseFunIG2XLhSLnJ164
         PQ3OhyJqfkw/5cETyxeLblZP2BFkBkjkNFy4ajFwn4VR4SxS7SP8p3xHnDcW4042gmNr
         I+QspFRp8pQ/ew1EwSBfyTAm6uCcs9qjul9yTN1vkZKYezT4tdt6bGy+utY/X6QSPCO4
         uaD2XuHA8rpn/HPgnvoE4BVzUSwhUWsr7Cjv1jHe6OThvmv0T3CUZRuj+pVxRoPXVFMJ
         eAtqtnVisaeWXQFaLt0aUDRoRHS89syuSCknWD482oQFhT3eP4cZqsBeJdSV4/TAkXOj
         SI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894676; x=1729499476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYpiwMgp/0jaR9U+wh+xTtNu0fqPqTVzNP6AS7gd9Q=;
        b=htePDNohhpCa6MqIqEMs+npA+OiYZUsv1YLOBMUoWq//U4N3jSYZIfnMyoXUyYYTTX
         7CD1GwOf+qOM+EWt/j67uLgUrmrVaSFZb9qa9tcG2IgsEJxuuAnwGj8G5A8+zY0lWXUW
         rdduZE1r8AOKUgsFOVlbzvZOKy/05I4sw6lZb5Kkp6h1wgTx6Oo0I/DZfKGRQTJ0NW8E
         dogUlO/220wwa5POOBsYE5WwowrLEy3ZXJZNn2VwzwwkHEiBmYanbP9A74eiUPP2nzB5
         ZyCUbX9INMeUIJHCYK3g58uFT/lmq7Pu2XY4LlBZz3JGbtATamRi4aqEjqWMxv8u5ci5
         uMrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNyp5Sv/C6lTa1i43tMyMtt49u30IoklzGatDklKtETOT12uwGdrXDTX4CYAQPMehcOZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfvy7SHgwcDtyrRTIcJ5aHW931YDu1xzcgOIjSMnL6h3Y2d0Ks
	YAngdBFx3LGmT5Pu6SoJ1tTaJHFy190r4zL4htf0u0j2M0TsP/XjnIbo4qM0dp4=
X-Google-Smtp-Source: AGHT+IF4ZeTiZ0TXalZNrlD6o7WG/tvA0YCER2qeJ3qHcdtTBeMwseRJMf6VI67pV1MSibnaeMxnPw==
X-Received: by 2002:a05:6402:2786:b0:5c9:615d:c784 with SMTP id 4fb4d7f45d1cf-5c9615dd641mr4858375a12.23.1728894676407;
        Mon, 14 Oct 2024 01:31:16 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711ba5dsm4634615a12.29.2024.10.14.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:31:15 -0700 (PDT)
Message-ID: <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
Date: Mon, 14 Oct 2024 09:31:14 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
> I do not understand the reasoning behind this change at all. I don't
> think DT maintainers ever suggested it (in fact, rather opposite:
> suggested using unevaluatedProps) and I think is not a consensus of any
> talks.

No there is not but then, how do you give consistent feedback except 
proposing something to be a baseline.

On the one hand you have upstream additionalProperties: false and 
unevaluatedProperites: false - it'd be better to have a consistent 
message on which is to be used.

---
bod
