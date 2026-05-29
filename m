Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD27C3FB7E5
	for <imx@lists.linux.dev>; Fri, 29 May 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066701; cv=none; b=W+StRBoi+ydIJpRGuI8pGAs+mG2j5dMBNfxvaOw8MrODeZmlNqK3GIXjoE4MWQrxym0UnEe4GPJygLlT3iP9jcq4xUGYP8W5/L+jEzgAvSDHCXbSGqAnu4D0SyLzmEj3pbUT07CwRhOAeFI/m/nGavJ4FtpRqQl7jSCP/XW7TEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066701; c=relaxed/simple;
	bh=TvDNOUNE5esDjb0VJzWZLByvq8d6tWkBf2WKUMK9i1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbN6effKHoxwN4ZX/Ta6L4UBWZUpBqUCr7hxUzdJeSmaf9anaAjYtmn3loZL28EvoPU0WHViYqta1bC0EdloWgnTxSRGGHvwAglmlcl0PtEubqeLe9HWDDioNJ4hQvWpcd38fsM3RWsrzKU4l2NCa1cHaubd0t9DmxVu4gZ9dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vvz1HYOj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vvz1HYOj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso83639425e9.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066698; x=1780671498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=Vvz1HYOj1Fgb3m/T3fkdh5uYUDuT0sPmHLKxnXIuvfgHBOA7jDcN74G3lR88gGn9E+
         fHB6RM+AIJKpEPaMONeegKOrxjwBvdygBPaTHXkrc2aWwh+fIkOy2JK5+qFFtwNtkH89
         R4ig3X+QQ2FCQBDZtJxRxBhRjfmHsVH84+HMDdWueRm8MpqlK1skyy8/Y/oi0/sgtKKE
         aG16BxAAC63X6TsXEdEGT0NV/ug74LznbwOgNvQ7QFUES1VH+oGOwLA9NUfYo1rFfSkF
         +PolwFeJzp83+xlu8AltZyNT1RIflcMVBthMJN0IKlI99JxS7LuD0Ax9O77q3b9nfY84
         KthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066698; x=1780671498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=qWcTXU0zpmJB4SEkV63/GD+xWR4HN/lKcLp8F1C2M8kSaQMZTNT9K9gO9nihrtU3ne
         kaC6g7nxf7ieE4IpDi0r6uOpDvf9gOu1GGRnP1Ly7tgz70MIBeq7FOVG8iAXM/tQ/KH9
         LgR3bqvDQEUdqzIAhT4yLeZ5wKb5v/n2qivOOKUODH9Ch6cY2GDpXk7j04P04j1Q0CZ6
         axwRguWXj6lkzyFDlUlWLsws2NkeMf04avIhRiSKWz2GwwI+lRP8uZF66fzysbfnJIOR
         k3n8eK8jWRpI6VVh9wqA5i5PCcm4R9rNO40QH76rWsMdO8TDXqL40KDU/OXmzj0MXFy4
         09ew==
X-Forwarded-Encrypted: i=1; AFNElJ/feTAitwAjgqbbyNk7gzYPZsD0E7qQxRu+JBcY/VbuKNbHRPLMMTPy9ehUelwo70AYpnY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEKnVFEp8PuI7d2DuKiBnk8WzskmrxeD96938IYHZFUd9JjUvY
	WKkdtHmj5z4AN50sxO1WPriyoQOwg7nznS3wNqSSaO1ltuFf44b2Pjucy6zNxERyFE0=
X-Gm-Gg: Acq92OFRihuXByHV7Yuf6prISIZsH6Zau50ezkkfK4Y7JEipwnxSsvqr/cSzHpi07A1
	EYuhWgeZKcJiFm3xZAkfUfzYvnDmDnB8JtVCeWlhzmU5r99JB9k/eo2NhyxXPd4A8Qon7jW7zkk
	A0GjN14OS9LVCJMevZIo3oPuNxPFOdYNEt1Jn+KxfwOnbNORjaJy/201ueosQMSd7o0hD17fBI2
	BuRukofDqK80aXdTC5Dabvz0et+ODheB+80TUNcYyaJitA2Kb1xd7ByeaYiTL8s8Wb8vu5hhjsz
	Bj2UYn5wDJie9EDylz40/OzwuiJDPiZJtfkkz1pcYjDcyI8MlJ0XcmK90tgMYE/zmWE2dgvAIeU
	oNXlBtki4CjHMG0B3zK/3yH7/2ZAxhLJiaZwraqdiXpAWw7yep0Isp6BwcoYCgQBVa5KizccSVn
	I0vitIsePjp+Fo5E5cerpvCBmH+0i7MchLkse9aElVBsQ=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57620855e9.26.1780066698120;
        Fri, 29 May 2026 07:58:18 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49445275e9.7.2026.05.29.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:17 -0700 (PDT)
Message-ID: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Date: Fri, 29 May 2026 15:58:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2026 15:52, Vikram Sharma wrote:
> Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
> for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
> Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
> "https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/"
> 
> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Which will be a problem as soon as CDM is attempted to be enabled and 
yaml changes are dropped upstream.

Hmm then it seems to me that five is too many for Agatti's IOMMU set.

I'd like a number list so that we are discussing facts instead of 
nebulous hypotheticals.

For both Agatti and Shikra.

---
bod
