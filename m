Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129E23D7FF
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489479; cv=none; b=Dbt+cprAvzI5YTRrGs3xIWusYEKD61TKW05XcXSoiguDhUsMDyiOKqvlchSbi6yG/2o2gY2vFuSa0cjHLNF+460osoZvduVnCg+t8YmEpX4sWD1I3SdQ13BKgJoZFynBDQVNyNBA0jGLWVH8XfCcxc1gcMLeztBloLlydIR9SpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489479; c=relaxed/simple;
	bh=S6MR2YNBRSzDuJOiJOdwNpywu7sQ3wKTTf2citvbdNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mfkiK+7e/WHsl4MFlcEQQVoE+8yWlF6z4YbvuaPnzSfkxnjuDbG+ZVBNPwOR38NzojgQXI+43ORYsxB/ZOzq4QobBNV5KmX+UhsyrBjBnek91U1xFOQ4V/UiQ9RdTBe1QL/6imza+zr6XniWhRIbjxsJ/SZvq0Bn7NZ/LlflxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=d9NfMqx/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="d9NfMqx/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B61A9112349;
	Mon,  6 Apr 2026 17:31:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775489475; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xTqqo0bM2Xp/vABBfMxTtslTbC0nEcFdtU9RVWpzvC0=;
	b=d9NfMqx/h4AterwS3pb9uaO184+AEpR9/8Mm0vRvs9yLYWBbiUUr0V5H+81Jdjoh0vbiA3
	A2J+qhLil58e1MlrZebVNYvehykoCA5MxzaQE8VqsCOURduIF3P7stxf0sodc2o3M7r1hy
	6WWmNSpk92X6H4x0dgjtkWbtWfKSk/DxPBFKIDtCNibREu0z3QJuK3eEF/JIcq9orKnxxY
	idfyFswFphl+FYR9vhGCb2/+4LKCM3e0QbCV36okK+Nt+ofOTmDsA6GBHFTvp1W2qWFRwy
	IFipw4+Mq8QhrdYPO+zQjtg71kprF/iHhTGmFJKCfkdjznlhTCPoRJofsT4ZWQ==
Message-ID: <41641a5c-8da1-4696-888c-454e6bf2eea2@nabladev.com>
Date: Mon, 6 Apr 2026 16:49:53 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-vhip4-evalboard-v2: Correct
 interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260406063810.25531-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/6/26 8:38 AM, Krzysztof Kozlowski wrote:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING
> 
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW
> 
> Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Marek Vasut <marex@nabladev.com>
