Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC51E531
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846982; cv=none; b=VnujeUsgtpmymO04EkTf5Z6RUskkOQ537QA0gVeKqzHIEKl9NDdZBttgYpOIqAQNacpdKzNY6B57NzgTwFBC6Fsg9grB/EhVc3hXAnx99m5rRzBLSMyry7SSbPAxng7JAOSR3XgZfGoFQIeLWNBmmZY5z8zix9g7V2F0RdeTMtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846982; c=relaxed/simple;
	bh=exKTE07mHM56JEN6zML1GUbV1qmMKOK94H5J27Lb5eQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=Qqtc6BFFe1gkNx8ZCZw79NMsk2/1GRgzzrh6d2kjcNAaXRKDaBJOA2VPGI6mpdhQIWv7+g+8wMtO/LZUdItBeCzXDZVY2uHQRCxYNyOuWp2UzDvjtIVH2nETl6PJbeJPCFLPkoKCDyamTg5mumIW5QBUpN7QB2FNg+Qwks+9ToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=t4zQE011; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="t4zQE011"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1D8E8A02D7;
	Thu,  6 Feb 2025 14:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=9IthvkQUSloN+jU4yaLe
	CO+AOQgNxpCCwaPiXCqsXVs=; b=t4zQE011ccbQ89ZD9bPeDDyb4u4SUWP1glT9
	CAupoRlmKb0Q77M6dRUMK5GRU2RSvRFlYrFI359l1VyHRWzhG0pIDgZltHDvB7eK
	1MD5ehD267tm9vmkbmrsnUVH6wbZ3tqPcPcKNVjY9Kl6YX5S4y+DvocH42pgIrsO
	p8ynpLwMWzEvHbsW5tiRd1xF8+NzACOA6YLLSld91DjjKvD+zQXd41caiYaBjlE5
	nCw/2qKyupfEIC4R/B0chZxGxcM95EmPeuR1PAzLEZtsugvfXfQV2qXZkJwUplze
	QuHBaOs40tNh43NwEE8U4GyzEerGZWszs5UnD16CTdhEUG4vI+LRjuvMWWWsip3i
	TMtOysY7BQ6YcyOaQGxQVmTVhZegNI2vDmCGMfdVHWTPUYGWHi/gu7OKWpVrcOTd
	1XR5m1PsUiNHuGdrT0VKlOmtma7Xa/6y998FiwYNalyDijB9hmWlcJ0m7Ct39QE1
	hY2Atk+JGCC86+CoNdLiM9rrtRyUx2pOVtIqQUiiNQqiwshkUmdw+LY4+mHbeCFw
	qTRzE5e5Hfy5tqJB90uqI488tRysXo4APELjb8Reb13nuPHIJyYNHOUE2IKptEfP
	9DYlKvZjECogPJWqeLpBaBEP/2FxOTNxt+QVWFpiSvGvFjxeHfKAFzugMAU85Wev
	Fu8LyBU=
Message-ID: <299a1239-7149-42f1-b3fb-ba538ae2a30a@prolan.hu>
Date: Thu, 6 Feb 2025 14:02:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH] net: fec: Refactor MAC reset to function
To: Simon Horman <horms@kernel.org>
CC: Laurent Badel <laurentbadel@eaton.com>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, <imx@lists.linux.dev>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>, Jacob Keller
	<jacob.e.keller@intel.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
References: <20250204093604.253436-2-csokas.bence@prolan.hu>
 <20250205132832.GC554665@kernel.org> <20250205134824.GF554665@kernel.org>
Content-Language: en-US
In-Reply-To: <20250205134824.GF554665@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667C62

Hi,
sorry for the confusion. I accidentally sent that one while editing the 
headers.

On 2025. 02. 05. 14:48, Simon Horman wrote:
>> Reviewed-by: Simon Horman <horms@kernel.org>
> 
> Sorry, I think I have to take that back for now.

Would you keep it if I retargeted to net-next without the Fixes: tags?

Bence

