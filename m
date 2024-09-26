Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0A15A4B0
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727370275; cv=none; b=t29che3pO/3hxyvOP4IrrhVgCAzuox++3qBES7PDPPL85s1NVVHvo/slPdwwlYbeI1udgPHXJO/n68G4ARf0dvdxn2MlBEY3m+392atE21wDjLACtjuah5XcfNEXbZXN9+24eJiybR74FJ4CbDXwgxdFGmDWw5mxqDufWmeXZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727370275; c=relaxed/simple;
	bh=5f7iNzg3O4AOFJ2dsDD5aJibRaUqhBU32lebHTPjxCY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=P88YGm9uqvo1yc9jMwS8mS26dA0fnbv3JW+wXwgq00ml0UNbnJIt4Yh0g5l/lhqCboBcKGWm8EU1DNoigDgi137zv0t2BzzhX+uNwB5eXsazDevCI14ZEhwodTTJ+WNBNmJAj25LnROVXXU4ni/GN9Pxe0bGbV8yJbxDYl0hswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.132.137) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 26 Sep
 2024 20:04:29 +0300
Message-ID: <5fa245ec-e931-6567-98b0-5d0a7cbfeb27@omp.ru>
Date: Thu, 26 Sep 2024 20:04:28 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1] ata: Fix typo in the comment
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Yan Zhen <yanzhen@vivo.com>, <dlemoal@kernel.org>, <cassel@kernel.org>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>
CC: <kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<opensource.kernel@vivo.com>
References: <20240926093755.3983833-1-yanzhen@vivo.com>
 <a5e93c28-bb7b-fdca-fd6b-a44eb3454980@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <a5e93c28-bb7b-fdca-fd6b-a44eb3454980@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 09/26/2024 16:46:57
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 188019 [Sep 26 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.132.137
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/26/2024 16:49:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/26/2024 2:22:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/26/24 20:01, Sergey Shtylyov wrote:

[...]

>> Correctly spelled comments make it easier for the reader to understand
> 
>    Makes. :-)

   Oops! Ignore me here. :-)

[...]

MBR, Sergey

