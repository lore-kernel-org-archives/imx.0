Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC13B2EBB98
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 03:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764819182; cv=none; b=EEiFbU9Bn/wJJdLgGUVt93HQ+x5tdLWr2hxhpiTKVcR83EWGOj1sQ2ODdZxJ/qncb5wTlCluq7tOj5T1dDRxdfb4dJrKqJsbVtq1Tta6/QxJlH+o2Ptv49kJy2wloy++jggmc+3w4JaSrhj3yYKtjahGFaKFhcQY8cuFhPyj0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764819182; c=relaxed/simple;
	bh=/zPFtqi1JccE7SD91qIOuCxRpO4qi6aC/YCFbUNFCPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhZSqsnL7pfbLHngmx383zy0K15e/ohAViMFpUXOat8hNbXFiK9hnPOg59XG9YDzrKHEhAv9gndTDiX215T5d8B7hFCLZYDAYu7w/kT67adVi/cfd8T9zjcT+FoQdTB2Qpf37ZqTPrqVRk1Y2Mry4ze6jJypTLLX/4JLQSjnsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dwE+My0U; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dwE+My0U"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dMKdw6YvBz9tgF;
	Thu,  4 Dec 2025 04:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764818741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ei7m5Ns3dLPcNqCQJpDdvbPz0mDTTjmXQeeMl3O7nUE=;
	b=dwE+My0UVhY4v5eRLWSFRAPYw2kNUO4i/dcFjOjGdyk4BO5RU8MZocxagUQIRqJ3RBo4wD
	uq6lAY48PfCrZu2iKST6NyPE0yLppY1/mryGjF3bCgPtEjOUBizcXNlrFSzuF+zf7iPqHQ
	sbqTPWd7P9qS8c5cMXlY9qZX8g79ZuDMwEg3S+j+7ho6X8aoQYsqE1ge5MoVDPOJzys89X
	y/WClgmaUQGH++o5jqOzXnSzf8yHazWcjC4icGa6fZ54DLSPsgpOtOlcSN+Lr8L+8QRFnh
	XzPb5OvRWTkdiOuIRUeFM+cVDrTQ62Zzi+otFv3Hqz5cbFtDNaqfpfxE7wYFog==
Message-ID: <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
Date: Thu, 4 Dec 2025 04:25:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aTD5np-HGaJqhzkD@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: eytu18s5usyrho7etfqi6p3r8n6fmfbr
X-MBO-RS-ID: a5ef938b78277bca17e

On 12/4/25 4:01 AM, Rain Yang wrote:

[...]
>>> For the Linux working environment,
>>> CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>>>
>>> Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>>> of its frequency in any OPP entry within the frequency table. Removing it
>>> could simplify the OPP handling logic and reduce unnecessary complexity.
>>
>> If the clock can be disabled by SM, Linux has to make sure they are NOT
>> disabled, so they must be described in DT, right ?
>>
>>> [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
> Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
> The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
> so describing any of them in DT is not necessary and would not be proper in this context.

Since this discussion is in fact unrelated to this bugfix, I would 
propose to fork the discussion into a separate patch. Can you please 
submit a patch for the GPUAPB clock ? Note that I believe GPUAPB clock 
have to be described in DT, if only because DT is a hardware 
description, and to make sure the GPUAPB clock are correctly enabled by 
the driver.
