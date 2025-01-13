Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58B14A629
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736755439; cv=none; b=GRpv+3iCX8vHXPdSx5f13Zwne1pHQCSTCoTZOByaaExvIyeAVagtqxrYl17oheBIUfM5TOrkC8fNvcQ2ohCRrzQ/t4fD3p4ZLCobaXTttYmpk0FIO+JSe6fG2n8nd9VuOjnfe/lDXYh/TqTed96vKC0lkMn1HrYCqZMEDmhLB6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736755439; c=relaxed/simple;
	bh=Rfrp9lOHU4M0RZg8njtneTcHVAWTXMYTfADOMni+x90=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y9h4E7d2e1t/184BSGZBFSvh3Er19FKNej6nq4uXu9NAKboupAUHlG+6pSc8qLyOLgBv/a5GEM4O22fz6p0+fOnNIO5MX1Wn38aIQXqX+oZCBiX9L9VKsSW8LMbT9kBumJOLuqUL0P1xzwXNAM/8Yk2Rd8zgeeMayT6HV0WY9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=THf2oCBc; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="THf2oCBc"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50D83ZXR026475;
	Mon, 13 Jan 2025 02:03:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736755415;
	bh=qSW8VsRMXbq3sSb57eaX0dEK1UpZGs9dyfJAciyuhos=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=THf2oCBc+cWD9sEwWiOq1EUoUG8XfBSDFs/vyyq450/w+4ZLTXiJJacNZ+2oYF/t9
	 zGZhDIIlUj7wtZ+heIDz8YamomhQ18Wd6alisu5dxljAgRSA4lPfUIZhL+aTk9lZZ1
	 oa6MaYRMQsC49E+lsW4eYnOgAMqPSWHmMFWw9CJk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50D83Z2V045615;
	Mon, 13 Jan 2025 02:03:35 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 02:03:34 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 02:03:34 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50D83T2u113090;
	Mon, 13 Jan 2025 02:03:29 -0600
Message-ID: <e08733fc-3dca-43e8-bcb6-c7d86c9f0982@ti.com>
Date: Mon, 13 Jan 2025 13:33:28 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] net: ti: icssg-prueth: Do not print physical
 memory addresses
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Roger Quadros
	<rogerq@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <imx@lists.linux.dev>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-1-3423889935f7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 12/01/25 7:02 pm, Krzysztof Kozlowski wrote:
> Debugging messages should not reveal anything about memory addresses.
> This also solves arm compile test warnings:
> 
>   drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:1034:49: error:
>     format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Werror,-Wformat]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

-- 
Thanks and Regards,
Danish
