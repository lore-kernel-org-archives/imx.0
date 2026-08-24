Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D6C331A4C
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787598007; cv=none; b=NVAvOWfwgk2jS5hurt1VxY/O0N8/sADTRs3toAP0ffwTfZtKJWuZeqjy+asMPF03GznoJV5P5MRu7tzSKSuS4kgtvUmUNXwC2OLK6pjJaNF3NPx2EVBfEbJQKTcfM/Pw5MKE2LzH0Y8sMLi/bxvyG67lRqNnK/yA+SlEJpjauLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787598007; c=relaxed/simple;
	bh=/G/bhdwSBXgxLht/9l67PKXD25LbrwqjA+HqIWeioC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWXyl8kp0SMphomdShoV2ZTT3tyKxqiY3w8viepDTEPy0GPp0vDVqs0ClVaQjNrX4uvtbeNpEe0r16k11hfljzbUa7qgJaDSsepyXq3bPAtbSHYf+q9mJhi2Zc6o1g4CWyo4+ixvoBzE30N7tzTLWTxZdZDbKicY50HEtTS4UDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z404nS+G; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z404nS+G"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-472326ca506so2017902f8f.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787598004; x=1788202804; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65NP61gKnJpo0qnqpfFXMm215YvFjmk0/dMgC3HflCE=;
        b=Z404nS+G9V1OkyaOM8GHO/+u3GUDvtWpYzmC4bSRBnZLtZ2xsPcEdhyGzGUkhb2M7K
         TlcGyN6+KTUHo/IYzA71e3d2QnP1Vyl5BhlKeG1JzeDrgNrwKnDkAt61GIcodb5bd3Eg
         XI5FTWjbuz/chpwdMRFt1O9wEXM36yHztHR+eK61OUGGcreHPTYyFYwlWgFqWp5vaUYY
         RDXhLJFpPV8aCdtZBKB5m6cnqUyRCB0BXK3m2kJCDFuYkS1Jp2CjN8o/ZvdBd2THu4nD
         OBiIn9PhU112ivlSnVmdnwKzDWX+rjObylh3OIi7RcE+ji1TLb32aJ9/HpG+I4T1iIyv
         EbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787598004; x=1788202804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65NP61gKnJpo0qnqpfFXMm215YvFjmk0/dMgC3HflCE=;
        b=pTqCLChjo0U53e0YLj7F5C0kGj2Ym7YJrbrZDRcTU9z8+ABEEsMETb090gx8apiSRC
         2APnzYopznxrkok3uJUU6H6t+iCwxY78/3mDOLrwkZE7PRAeJS73VFMLXrk3xW+T+1om
         1x/h6qzy135Rex02FIqXtNd4iW4XclwxiqSNhdj9DNBBCwzdu3I3lBZxM2LYBC109Ols
         Pegsra5dNMoQrNKztda99WTdctGKAB+wIdEnTkCLQRAAEI4qKnkRjmG8C5UsG7x+AwAd
         9ONvSx8F++DVSZEuZyqKJZXiLNVfORGzmgDUrRRuiIHcAePqsWUMAJcGmvMz06ElXA0Y
         sMRw==
X-Forwarded-Encrypted: i=1; AHgh+RpaBgchyGZ4UVUIBW+Ex67dIy8hsSF47/VaPsPnlXkqVLbjHZbP2BWEDb5j/uC/j10gEWc=@lists.linux.dev
X-Gm-Message-State: AFuF++kWMLVJjpK0oHqBGz0qibyGw2X6orw6eltGyKnfeUm8IAzJf8OR
	OHmS0p6IcjqmuDOFpgzWygzbZAeBn5kJ4N0rSfGsW70/dTRz5XBvDens
X-Gm-Gg: AR+sD10ipaorqBvBKzBu6C0L8rlglqWooGqZPEeCjAPl65PM7cFQ8mdh1bFYEuvtLI8
	Qb8tobYpCyJUW/XIB0eRmMoXsgLcJGCX68OmwA4EP+Qsr6SMQA+gwcZVvbUWNiHKMXx055iAV06
	Wy7TyaZgiKTX1zVUgI6eLMpRQa1rMZtWPjO0Od/mF52NxJqPBu4oIHp9djzKpfh4y4GHSEtp/Z0
	YJtemwpuy4OZgiV85SrkYYer+5DL0GLWyCSVC6TzXmlBUuABZ70krLUEn3MFxjaQ5zGEamj1eJb
	veMKkN5FkTb/AhkNfI7isk5QZapHcS3GQBO+Iq+biNTCI+WghjUwIlTHOn1QxuNb4mvv/B88/KP
	DQIwQAb6XSDP7dLS8LRmyhHgZ+f3L+WEw+omjYyrCQyPxHQcQnhdrFeHD6vSuaIj2AN3LPbxjQS
	XtQ+Oyd7owyWmhnU58RXGnE2PdKoT3FAnti31vGywPSYJZSYtix+ExzA4TwizujSBUvCF3d3mGd
	6cyHKo90Dq0xAfVHPMLTUSLK+Yhj5oJuIkm6sBg+QECp8l+BmoTKeW8jOpGhtfvvsmI
X-Received: by 2002:a05:6000:400c:b0:481:5bce:44b3 with SMTP id ffacd0b85a97d-482c0ba22e3mr37716386f8f.16.1787598004049;
        Mon, 24 Aug 2026 12:00:04 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm8813534f8f.22.2026.08.24.12.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 12:00:03 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <928e0a09-edd0-4f1d-ac6b-c225b4cd6fab@gmail.com>
Date: Mon, 24 Aug 2026 20:00:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
To: Marc Zyngier <maz@kernel.org>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 linux@armlinux.org.uk, tglx@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, bcm-kernel-feedback-list@broadcom.com,
 radu@rendec.net, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, sudeep.holla@kernel.org,
 mark.rutland@arm.com, lpieralisi@kernel.org
References: <20260823180832.1246363-1-julianbraha@gmail.com>
 <87cxv7o62i.wl-maz@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <87cxv7o62i.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marc,

On 8/24/26 17:07, Marc Zyngier wrote:
> On Sun, 23 Aug 2026 19:08:32 +0100,
> Julian Braha <julianbraha@gmail.com> wrote:
>>
>> ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
>> dependency, ARM_PSCI_FW, is met. However, ARM_PSCI_FW is always enabled on
>> for arm64, and the GICv3 driver only uses HAVE_ARM_SMCCC_DISCOVERY to
>> identify the NVIDIA T241, which is arm64 anyway.
>>
>> Also adds fallbacks for callers to avoid needing #ifdef guards when
>> HAVE_ARM_SMCCC_DISCOVERY is disabled (32bit arm).
> 
> What does this 'Also' tell you? That this part is in the wrong patch.
> 
> This should be split in two different patches, fixing different
> problems.  One to allow graceful fallback of the SMCCC_DISCOVERY stuff
> when it isn't selected, and another to only force the selection of
> that option on arm64 when GICv3 is selected.
> 

Thank you for reviewing, will split out these changes.

- Julian Braha

