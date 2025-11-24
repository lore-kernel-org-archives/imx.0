Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3FC261B9D
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976518; cv=none; b=sXO9xQkTfRPhLMNbOMSni/v5e1VRAWGMsK+mApEMJEjE7uZpJ2BiqBojlZHiF3ojyCYp1bRHWWqt4BIy75kybPZtcvpwSTH5KDezIoE+WCwiYZT9N9WswTDp0ayxScWdgjJh7+gW2d2WPG8bn+v4H7HD6VNSOtpax20VbG5Xnm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976518; c=relaxed/simple;
	bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoqPr2VEf7e35I8JZBUTrBziHRC+BN9lqdsJqS+1NprfmIbzXaUfUy0OdG01N7FM3kgJ7lGHZB4cj6Z88F709yBVvb7X8LetrwnnY3/pr5IBu/NJwu7aZyM2aiYD4NEBSojZDCILF1Msbx6OKXfS8vlAXHJ0DQVhqDj37SgFtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bi44+3Hk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bi44+3Hk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73545723ebso760564866b.1
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 01:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763976515; x=1764581315; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=;
        b=bi44+3HkbsL0SNEuUn+OhhYqyIn7O5k4lLA1mKBBJ+2ccodvsWbwMnoNBbVycvOUtG
         SwYD97FtuvNjefuPIZSc+9WPQCE6du9MWPk4IGoQYsvrs6jArlrslWiAoqkayI5GKjFV
         8Isaz8GHmcBguuaN/Hak9AdnJK40ySEificbSt5U5fJPzLsUhVjvlHvIM8FeZNBvsQUu
         v4dSYrrk9ESYYPeJArxuxSxvRhXiFKHqCIAl9xrZTGc4uFANxcKEL68Qy06VCq/rWuSm
         dwN43g10nxTmQAibAA8VBOhFUiGRpPDkzo0/2ds65mpzDWXSPl+99cOl6rLKJufKBWlI
         q0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976515; x=1764581315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq/6lrLjwUQVKmC89a4ZJKQFFN+bx+P+dHA1xIdfkLY=;
        b=ICXvUoinTPl0xhrGyT9vYJe6LPXTD5GsF2nI70rSHIECOXtKBdZcRnXocg7oGqisgK
         qnpbpufpUH1HJG1Qlo8uPPRONI4iiuCBLwgGvMOrfyiGsWe40TyLY7NoQVqiBnTOMzRz
         CWxyDvQkFnpTFvi9Q9myAoFyPpDqdBR94pBqVBGcnkVvIVV7IxRe+ZW889+DZJssp9Og
         WwfbmGNb9TrNWhunMKKwvx8qYuxv5eZ3ihmyL5WNnmFZ1OOn4mF4OLxWqqMqollt4dbZ
         1U9DEBQ5apm9D5f3Jni1OGxSZ4xT4i5NobaQVDPUVBlJLeh4eD/uylVpiHUDxQsfsrgx
         9ydg==
X-Forwarded-Encrypted: i=1; AJvYcCWeVukGJRWEATK83uNmc3ddQbFcWiY/g36nQMKET+dK0SsnevmvqYgD2QAmdYz3YSDhfdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyidJbMJA7lO36RyVFCH5KrOz9i7QS6OzR2HvHKN96fEtrskR1G
	5K8wqvU+WKfzszcyXIqDJB39UgrkvjqALhJC3QbsEvGJ1lbXpQ4edDmj
X-Gm-Gg: ASbGncsOPPQmABolyGknMt3FDuTVn0o/x3rPJ8NDMpm7KBV6loHxIN9/go/2jgclnBy
	6Lu19B/BBVsgMRr2l5ZnttxJSmPha075PlkPMt/whdoagXB9nhkkhYx28Z5cmrutyve0i5F9g12
	f1j+roVWNZi/SXaSMA7V+s6CRnAjxamwfayHqYSEQGyEPaso6jv6qk8Agnh+GIiOttOVVPHOi84
	zKe+b+DuN7suTJO25vG7qGKNkij1/vOqqv825o3n47sz9B8okn6pGs5RDurJjaRKFb1wukFo8Me
	03LtZe1rrsXu2TU+slKZT7V/SOgmrin7tikhztQCi7A3R5toCIck9Xd69VE5GCyY2QAeGw8tXJy
	VXTgLT5grBolC30wkI5A78IKh+8kQeCzi8lguQg1p4tZAHu7YcgEfafGDacVV9EG9jHs8x+kqV+
	0J8XLYB7BZvYuBCbvXeQYmzAw6ZUxaTVqFSMXY9v0DRCU=
X-Google-Smtp-Source: AGHT+IE64Vdc/C7dTNfZKSE3Kij05EfXqApdigFOyeLPFVhuSXQ5Ul35Nks9lJUeS+6q64Q+0gMqzQ==
X-Received: by 2002:a17:907:968c:b0:b3c:8940:6239 with SMTP id a640c23a62f3a-b7671b12672mr1131781566b.52.1763976514338;
        Mon, 24 Nov 2025 01:28:34 -0800 (PST)
Received: from [10.25.210.163] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4fc4sm1250447466b.43.2025.11.24.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:28:34 -0800 (PST)
Message-ID: <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
Date: Mon, 24 Nov 2025 01:28:32 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/21/2025 7:38 AM, Frank Li wrote:
> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Replace the reset map mask with the bit index to make it clear that all
>> reset lines are managed by exactly 1 bit.
> I don't think there are benefit because I met some periphal need a magic
> number to reset.


Please provide more information. What SoC? Which peripherals? What block control?

