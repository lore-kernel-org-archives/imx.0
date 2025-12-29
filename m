Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27C83C2D
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 03:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766977442; cv=none; b=IZ8qVo42QaGxdTUYqZ/KHhGiCW0oY5iXPoNY2xAj/l9etCU3LBEWWAwHTpmjlixgaJFR7F1i86McKRfv7X3YbMRBO8hJWo2Cq2o7WLIehaAfgbd23re8CnbkEi6eI6BDHc+CusGMragH3ynkT3VCmlmTVRbzAVcXz/Qof6N+meY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766977442; c=relaxed/simple;
	bh=Vzx2ORHoRFpajEaWoSeHVtN7haybZ0dBfjlE54nzC3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqFTj8vaP8ql3LH1COzxju5H+fejGaV8JnIwPeiKYhFciDSL2GO7PJTv50MIAbsoQOUc11Vs52Ui8xFVXkNsVXtwJRw/pw1QfHJKAE7AbBBdaaUx5zplOqSwni4wNWXA70IiV+GZKlb4O3/KJ8HDC6I/w2e8jn9ywkZE/50UxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SUtLtPrg; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SUtLtPrg"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dfglm07GFz9t5G;
	Mon, 29 Dec 2025 03:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766976836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75B4gxMdiRXoDbJNgqXGfnhtWbwMTHh+zPhA5Svb3G8=;
	b=SUtLtPrgzr3EoF0uqM0r229UqRIsxVebpxhK2jxnCDcO94zq9P6Bnn1yqqgfZZWJa18OQ1
	1CQH0ZyRvzwDI71o3r+jtyfUOAOeGqsrETlxZYnmOFEsso+opmjoJ+1mbOx0h6OUR5RQsZ
	TKa1EYVDB+V41hhOWvebwE/87GbIATErVvNRsM6Mzn9oFFGppNJI4X4HYflQq19JFkBL3V
	QR3ZI/DA+UH0V1ACLhr8+C7uY20YTQ4jB6uRX/w1bMmPLl4AGT6zpO83aqMsUqlLdzopNn
	0nwjEHkWhaJ9T456AjOKApcgGlkn0p7wvc6Sk1AVzQzstBiyYO4fCsPKZLSWCQ==
Message-ID: <b61fc304-26e0-422f-bb31-303e7bcbb824@mailbox.org>
Date: Mon, 29 Dec 2025 03:53:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC
 DT to rev.903
To: Shawn Guo <shawnguo@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org> <aVHqlnNGNGmaF14m@dragon>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVHqlnNGNGmaF14m@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 29f1afb84c51a004196
X-MBO-RS-META: kspase6p397kpcxioyds6askqkgd9zd9

On 12/29/25 3:42 AM, Shawn Guo wrote:
> On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
>> On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
>>
>> Hello Shawn,
>>
>>> On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
>>>> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
>>>> board which implements significant changes. Keep some of the rev.900
>>>> and rev.902 nodes in the DT so that a DTO can be used to support old
>>>> rev.900 and rev.902 boards easily.
>>
>> [...]
>>
>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
>>> 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
>>> 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
>>
>> This is addressed in bindings patch [1] . Can this patch and the bindings
>> patch be applied ?
>>
>> https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/
> 
> Could you resend them?
Why ? The emails are in lore/patchwork and the patches still apply just 
fine, don't they ?
