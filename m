Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D573B8BD1
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323337; cv=none; b=h8kVkiERDMLgzzZIuSKCypXOGkG/5FZ7wYDlO1ZOaq7VGXJWLwI4NWUum7G9pzrvlH5O/fMlLA4ZqNuGOCp/qOoBCtHPKbiGdovxO/78doOJnlylTTt0m2uzkakf/DgFnNSPSXmtQtDAKsOL3/6CWOKgyVkSgLn5wDn37Ogp4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323337; c=relaxed/simple;
	bh=IxB7Fd79A3gZ1r/a8Cr3tbT307HV68s4njAYnRINXlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA6mFNzh6+WtvrkjYvFTewABRVnKUainaCpWdp2yvy6SnS4oEh5L3pId2cQmgIs3Ll0m1dD0UlGj3XGHxcpwkeZVtTQenYB1SZdbzQnUKQWIloLRUqX3Ov/+vYU2pnVmxCDBi95ZzJzOSwaf4+RnY1iDqvKIcIPVST6RBx3TewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHRj6FqM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHRj6FqM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eee266c6cso2912693f8f.1
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323335; x=1780928135; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=bHRj6FqMzYYnt7p55t5c6KXXIP4q6h4MwSFwkUC4EmtFzvJPUOPMeSIegW1ixnPapb
         yCn3njrevPxHl/HhqxUi2MVOqqojSH0yR+owB33E/zJfU9whX5/z7XrtjDIuUSxg65+6
         a611Aps3rIXWMQfkpigZLV/XHGALZXOT/rC+noTfjZgIZFj5IlNcE+x0LSJPsVpHNnBy
         Pf5DPOpu45VFoUo3czlPyCF8AhQIprenUWETAc3F0lpy+/cHg8+H+CDyZjDXSjFKGd1P
         vAhktcnUEARFG4ln9df0opS3rlHW+UzAVy/gTT259wFTJiYMJDZFuhbNUSPEw9n9z476
         kFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323335; x=1780928135;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=FRVahDIR4Y5ZLG9X2fXa/rLxQe4Bxeob0p4n2p6aG1v5IoMdYtTFTdCeeXNhOJcSwO
         85+XZhYQ+7KVH6aYsMGQSz03Nn9KNODLwtRz5uc8nvqDgq/b4c/WoX5G0lzdVJGMGzG5
         blr+vawvOEPsWaZ/ck17N46x2Oz1qiWKTFv7z11K3W1vgrd4MJjexFsghtCmk+RcvCBm
         65lC1RqAdSAQG1h1V4+C9rIQb1cqXsCP0jjbretAO+ACnYO+HKSEwTK6iSdYfGnF+i7p
         XOC/rHwFdxrn0qfYMJiZM2mNwyHy67TG5BCIKrYb7CfLpY/tPc/saBnG03lMwj61YtZL
         pogw==
X-Forwarded-Encrypted: i=1; AFNElJ/Da40YbWxCymdqwDtKGt4ojPp3ZYgw/YOUCT0e8WgOGXsIt8efF6LaUa+mzgaRy5GAlkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoFbjJ5o2AcuNufzicKMTKK5kNbLUvYaHb1NKLuc3m8tjL3z4d
	JhZsXxfxWb75Bu145qlbypPwUrEqxf88cPePnFzC5Sw2/WQvdvUzsM60HY4vhjrNVYE=
X-Gm-Gg: Acq92OHPaqlr4oOhlmcs4knMyV9C8HyUHFsBp2TxjVaRme+wbzK2F/OsppCK8ySu9Rx
	KuZ4rPMmhwGZaVIdrsPma2y8iUrmTfV+DoQBdwFps/deHkOWsAm1RW1gGs16uMf+5nFUh6aGEPI
	V0yx8YosduRT388eLpbXDTA7W4sp5S9XQJCmxabSOOks4mqjaPa6yROwWRYJWyP7RuMWNnJuSuU
	WbUEQ3i1Fr6FIxhe1zKONP9+fe9SttJvgjd+k6pjt7s1dZyEE6aMAKIIT/1hpX34FmddLRWl35Q
	PcjciBDmN/1/ztUcXszVPHojad6okf5qHybDm/bFk42r1jIPEPpP04D6A1Fq5dFWiHSxmJ5oZ93
	lv9VBADulxH6xY3uxJMmaemWGmigAbURIVvLq5fOF8k4hZVvE1t+PpYqFuZeOehh+Omd8f+6y50
	cXMjpJPVXoboh6N1RFLasv5Td3ETKb9p4kHjDN70fNXf1P2h82PmA03GYf
X-Received: by 2002:a05:6000:4610:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45ef6b670e1mr21405913f8f.26.1780323334783;
        Mon, 01 Jun 2026 07:15:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm27847640f8f.9.2026.06.01.07.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:15:33 -0700 (PDT)
Message-ID: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
Date: Mon, 1 Jun 2026 15:15:32 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
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
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> Here is the full IOMMU SID list for both platforms:
> Agatti (QCM2290):
> - 0x0400 0x00 — VFE non-protected
> - 0x0800 0x00 — CDM non-protected
> - 0x0820 0x00 — OPE read non-protected
> - 0x0840 0x00 — OPE write non-protected
> 
> Shikra:
> - 0x0400 0x00 — VFE non-protected
> - 0x0600 0x00 — CDM non-protected
> - 0x0620 0x00 — OPE read non-protected
> - 0x0640 0x00 — OPE write non-protected

What this tells me is that the Agatti binding is incorrect for addition 
of OPE as a separate device.

> Only VFE SID (0x0400) is shared between the two platforms.

Both platforms have the same IOMMU list, its just that you are 
correcting a bug in Agatti's defintion.

Again only IFE SIDs should be included in CAMSS...

> The current Shikra submission enumerates only the VFE SID.

Great, this is what we want.

I think for future submissions we need to be commenting, naming, 
something each IOMMU entry as we have a problem now in Agatti and a 
legacy problem - already - in VIDC as a result of misallocated IOMMU 
entries.
> Should CDM and OPE each get a separate YAML binding like [1], or
> should both be part of the CAMSS YAML binding? If part of CAMSS,
> please confirm and we will add their SIDs in the DTS in the next revision.
> [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/

Yes I think CDM should be a standalone block and BTW use standard DMA 
APIs with its own IOMMU entry.

Similarly so OPE.

The CAMSS node should only contain the IFE SIDs.

So, actually I think your IOMMU defintion is correct but Agatti is not.

Sigh.

---
bod
