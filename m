Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5BF212572
	for <imx@lists.linux.dev>; Mon,  1 Sep 2025 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756701585; cv=none; b=KFkL/lChTZ+dtuzuKxCao6VzK4hEv48ZbW63sg8LDLQlvUjLHJ27Ajb8f4lN9TjNBOcACfffzAG/fzv0rlDvmP9WLVPTgW/6dYNAW5pE/hLVS7h03j6EvJsvpSs+H7IPO1+zSfHFQ3EMF4jbUpNHEXT+00bXgJPax13e4/Iy8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756701585; c=relaxed/simple;
	bh=qt+dCKV6519As6mQx+5oZLy5Y7d4TQ2O1wkM7GyzqXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKn8SttmKZH4rAMRMp7h8l9qv6MoTfcmTi2EYnToc9Y2sqGMaKSZ53+92ZxazTCxaWrSlrVebpdfOZDp04p5ZbXzCm02H59NV/lI3urdvzZiZjhdYm4qXV2BZCPhxjgUa6jMAzxSBCad3fzqSXqSm+30oHJh284BgwX+VmbZmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bzJQgNFo; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bzJQgNFo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D664105A26;
	Mon,  1 Sep 2025 06:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1756701057;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=quDK9J6zNIvpJEID6bs9zR7wT+kKDFkKNW3zLnLB/YI=;
	b=bzJQgNFof6zUwcL4ZoVzZy16oEN20bmKOjJL889sBGUDlqXpyG8YmN6+e6f+OgBkc5GMKO
	lU0nfn6opw9N1+MTB+e5hFhNPBAzSorQkqU8xCq7IAp7rfmG2bfzePfCN32aUnHtAnJYTG
	kh6x5LPQQ4TsgFdovW5QBeMce7qXlBczosh2fn+pKmiJRDCxS1CKzxgp1FDGRgXqPoA8kB
	UiDqo/3LyMB/PX8Aj/i5po8dq4pgfE/ZBB6r60W+d1McQgHiOujtxY4LLfMH6S4v7nHRXK
	lrx0yhj4pCVQxzzn3FEfaqqSBryAFrHjp6GSjzi6if0QMb91PesWLOs//s30+g==
Message-ID: <ddab6133-076c-53b0-b425-c65a5447f666@nabladev.com>
Date: Mon, 1 Sep 2025 06:31:25 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] ARM: dts: imx6-aristainetos2: Replace license text
 comment with SPDX identifier
Content-Language: en-US
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Heiko Schocher <hs@denx.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Erika Unter <e.unter@denx.de>
References: <20250709-abb-dts-lic-v2-1-adc5e4781f65@prolan.hu>
 <58709258-9154-4ec1-b64c-5be161b061e8@prolan.hu>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <58709258-9154-4ec1-b64c-5be161b061e8@prolan.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Bence,

Sorry was in vacation...

On 13.08.25 17:11, Csókás Bence wrote:
> Hi Heiko,
> 
> On 2025. 07. 09. 9:28, Bence Csókás wrote:
>> Replace verbatim license text with a `SPDX-License-Identifier`.
>>
>> The comment header mis-attributes this license to be "X11", but the
>> license text does not include the last line "Except as contained in this
>> notice, the name of the X Consortium shall not be used in advertising or
>> otherwise to promote the sale, use or other dealings in this Software
>> without prior written authorization from the X Consortium.". Therefore,
>> this license is actually equivalent to the SPDX "MIT" license (confirmed
>> by text diffing).
>>
>> Cc: Heiko Schocher <hs@denx.de>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> 
> Do you agree with this change?

Reviewed-by: Heiko Schocher <hs@nabladev.com>

bye,
Heiko
-- 
Nabla Software Engineering
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Geschäftsführer : Stefano Babic
