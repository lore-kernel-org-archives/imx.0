Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44A218AAA
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148984; cv=none; b=QSgPn8l6xLc7b+z/wIxWnqcjVr1n2woj7XTkcCCXB161OPunJ8IbmFYYoKflDaN35OKXh3YJvWRf1+d6UyAz8NAQJc0VXyyGuseHESN4+208WC9WmXZDVw3ROPMg7WIcHv7pBJKcfKDc2ObP+OCiF/myUZ+1RR+r6DdT5pAadv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148984; c=relaxed/simple;
	bh=h5DYFAuVio36yz2xdt6veVQ5MCUC5Nm4S8ZwBFwoY0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dI/87h7WEU5UOMR7nv2WAp4rgHVD48Nkx3fk6q6EiCp5kkB02V1WvB8G+3qtrJc7FpiZZUFuq582xWEHcTbP31bDJMz5OORE1sPhX+Odj2y5eo6353I82nPD/rUdVSJ2s8G0mDFobGXubtznQYtnbPG8QkGsJDjg7sj2nwhx+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=C/JOA3gl; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=C/JOA3gl; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="C/JOA3gl";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="C/JOA3gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750148981; bh=h5DYFAuVio36yz2xdt6veVQ5MCUC5Nm4S8ZwBFwoY0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C/JOA3glTSbRXGeZeqLoLH68R1plBk58aC5zMHcoksNNV/JUU4bj9C+2R6G8aKNWF
	 jA6ysYWnp70OXrZv6RE8gVfoA36DcMwkjrXxBI8V8tLLd0/mY/xzSrMBhIgLBsevFs
	 WN1sYLB0i1IwBQ50L2w8lJN1jKaT2ZPH7RX2lYH7oQmy5qhYdrNkd1fWZGiSuaXXj6
	 3ox0J3azzKkwywV2EfwuOs33LKMjfkMRxs/9ay7QF9lVbVV5fURiNaC7g50bTuzMcr
	 HySSy8ll6mvUchFt9KygO8PtMVd78w3jB9EpBvNgQ7e59xbkA+tu7ZyO+4zLWqgl5Y
	 xlddVDVjfAkrQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 54F4B3C2B97;
	Tue, 17 Jun 2025 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750148981; bh=h5DYFAuVio36yz2xdt6veVQ5MCUC5Nm4S8ZwBFwoY0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C/JOA3glTSbRXGeZeqLoLH68R1plBk58aC5zMHcoksNNV/JUU4bj9C+2R6G8aKNWF
	 jA6ysYWnp70OXrZv6RE8gVfoA36DcMwkjrXxBI8V8tLLd0/mY/xzSrMBhIgLBsevFs
	 WN1sYLB0i1IwBQ50L2w8lJN1jKaT2ZPH7RX2lYH7oQmy5qhYdrNkd1fWZGiSuaXXj6
	 3ox0J3azzKkwywV2EfwuOs33LKMjfkMRxs/9ay7QF9lVbVV5fURiNaC7g50bTuzMcr
	 HySSy8ll6mvUchFt9KygO8PtMVd78w3jB9EpBvNgQ7e59xbkA+tu7ZyO+4zLWqgl5Y
	 xlddVDVjfAkrQ==
Message-ID: <804c0ad1-3ab0-48be-b58e-8c67ac92d12c@mleia.com>
Date: Tue, 17 Jun 2025 11:29:39 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Content-Language: ru-RU
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Roland Stigge <stigge@antcom.de>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250606164012.1363896-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250606164012.1363896-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250617_082941_376528_41F3FF3A 
X-CRM114-Status: UNSURE (   5.72  )
X-CRM114-Notice: Please train this message. 

On 6/6/25 19:40, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the change.

--
Best wishes,
Vladimir
