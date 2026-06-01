Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60436B059
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325928; cv=none; b=acT9uijoshVZMvT3lkmAH88SLLwQ+WUdQzbIW4T8M+fY8vJLdKs6Zm/jlOg33AGv7h6uC6tv0kb2PGM7YwwjU9uLt02iyTrxNwjE9zM7weKRVhn+FH2lDoU+ur+wRf41nAmtQ4/74RXgXq7eN93vkgeH2V2qeOx7uZbqfnYHETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325928; c=relaxed/simple;
	bh=rqBnj7fgbdJlTrVFKmmoGA6nL2axLMyCnfR2JX+G2hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/x3TvAF63iEKSK3kGjG7VXp2oT2lBM+48L2Rao2z0LcMREso6lG01tG/Z991TCU3NtdX2iChEyJeDkIkq2eaERSxA3BxL/kVeJHs518mKX+goD/B+Uz77I3zbAbrKWhpd/1H4n0+/on49dmPCZjAcY+EKJgXGi8717aZ8snByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zghDcjny; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zghDcjny"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4639295e9.0
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780325925; x=1780930725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=zghDcjnyzX28O6pset3PkY3vdtXUNuUSpmEem1Y0vQgeMlgVSRUS0lNGBQ7m1sDKQu
         aGgid7Woz8TlAI6ZKPIjUCODgl657P3RTcS6Jc8AZkfToRy5en5SM6Kth6OEhqwK1ZLB
         TJOI45vltjh/eEAErF82U0mBcFNbT2l5Ir/veEtSxp+Wf+Uo3r+GXUvb7i/lZHwYo4AM
         iEs2FDT2QUPdZRBbyPo6afyixa9mEF25NETuCqA0dZABtCxey+wCPlftzwAwM7vtf6Ik
         f4tnN8cVglhX/aF3x2G35H7SdSAoNIurqyi/hmNQUuWMFV9c9wE/qw6Ad5wnU3A8TqC1
         rOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325925; x=1780930725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=ZFCZ1ZiI+Z2HefW1qfjj2PO3Av1xUXT7IItjGFPtecp18G64C1SGUY1xvNJRKYc9JV
         7s8FcPrjJFfJLknQd5dgjhlM/pbbFA+6/VSKCekHLCCPb1aiGGfhJDspGKO/LTaiT8Ji
         0xwYmIl+FbCkgsdnU9QlkA+QEjJqWrlr1RK/uyeoQIcPaRUJDyHSPrR1ytl67XMH7EvQ
         ld4s3fyXDRBu+qVDmyHqKy4tYiqUO9JeRHk0+zmSHgWhY4AiBQcnioAmRfpbJbryzkU/
         OMRZsFDDX97HlJd9cxVNxKcjCsGyRCiSkLkLy6rspaZko1MJpyskuA4YZXEnoi79MVlh
         lsVA==
X-Forwarded-Encrypted: i=1; AFNElJ8okb/6NrrKQuL5RgQX0w1WYUwrsRWjISUY+hkFdJYP7JE9xWw83Xh93aJN/xzKexhitqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIhfCTyX8g+9dhiwBnpIvDJ83zZpnYx7eInHSn3JpfVWAVJhkj
	hqn+XpbBpqnLjwBGCyGGyWn/NaYtl+VDAfp1I60HRdCzsmnuxpFmhNTgrJgyM4AjGcs=
X-Gm-Gg: Acq92OGJN4J1PVhDj8SJFElllNis1LYD0Zb/BnHT2Snmf0SVUwpga4K2zYDB7HEKISl
	xFPhhXPG9U/Qa/nnFEaIpLYgZHQizru1ND0vjTIn9M85ePIkE+UplRT0RBskANaZAOj9MbZA6hp
	pYcjIjc8xIR1ZFS6Cvs41tpaLN+eM/Txw63YSUCOUaPpWaRjf6jBkLfyNp28wPElLynqrnG9hvy
	oNEdowha7w571U+kX4kyp6hvbgo7n6RuEHPMSRuggPiS99zg12q8mr/Cxc+MbZbxBgZgoWpHHLR
	oVjYHFNQkt2Sw2ma6MtiW14m2x3d6Z1A9qZN6pP/LTNUpRD8NKaE3DriODobAXFBRKeKNZ2wXUv
	db/tqOXv9d3JBqSw/bM52WIkSlt6TjOp3QPti30K/wrbZRpWpxG+eL9sv8bKAwfUR0Av7BmH8Ei
	9/FHjEwJjs4Ay3Hvk6bjAJILhh3B+d9yD7pATKfF9JfoDsew==
X-Received: by 2002:a05:600c:564a:b0:490:53b0:9e5a with SMTP id 5b1f17b1804b1-4909c11c15cmr174298335e9.5.1780325925446;
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm25172652f8f.0.2026.06.01.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Message-ID: <2d7430bc-1bb5-47ff-95c7-c5c4d880cdf2@linaro.org>
Date: Mon, 1 Jun 2026 15:58:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
 <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2026 15:27, Loic Poulain wrote:
>> Yes I think CDM should be a standalone block and BTW use standard DMA
>> APIs with its own IOMMU entry.
> Interesting, so CDM should be a dedicated subnode as well, and not
> part of the OPE?
> Then, If we want to use it from OPE at some point we would need some
> 'cdm' phandle in OPE node.

Your question makes me think again.

CAMSS:
- IFE/CDM
- IFE Lite/CDM

HFI/BPS/IPE
- BPS/CDM
- IPE/CDM

OPE:
- OPE/CDM

I believe those are the mappings of the various SIDs too.

Come to think of it there is every reason to model the CDM block as

cdm-ife0@ {
     iommus = <IFE0_SID>;
};

cdm-ope0@ {
     iommus = <etc>;
}

And then do use the dma engine API to shift data. I don't see why the 
IFE, OPE or BPS needs to map the IOMMUs and if you are using the BPS via 
HFI you'd simply leave the cdm-bps@ {} disabled in your dtsi anyway.

We should excise CDM IOMMUs unless/until we come to implement CDMs as 
standalone nodes.

I'm open to being corrected of course :)
---
bod
