Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2072395D87
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239311; cv=none; b=du1gpWKd1A8+owjrk/T6MtWhN4kZy2E5LsH+/QvKODC3mYqGORbxnSoZXjOPzMyGyqyJxnejJZzyPW4JUJDhBgbVVRWdjABkgjHH98GQ76jSCd1gpci8FiOFlXHbx+siuURyvFThkBKa6fFYZAXTSJwianxUMnp/ZPDCl+x4N1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239311; c=relaxed/simple;
	bh=frlJDIleyh79vVEq//ZCjrTfsk/xwJyh0JjtzyjV9xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCHQKsgJ8B6+TOnCpt9BMsXldnu1zGeefL8Ol3SPS/c+FYZxWHP51qcK+any0Z7bMT+0hP+Wj+6LshVnBKE9kPPJxuZyBuEqMKSYbNyAIkAAIOsaZnf3XlA+m/I3m1nY3U463jf/mPhkWKyr9kIVBv9kKsVFXSfsBVT1AG4pszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FQ2270zn; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FQ2270zn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5EBE111D1C;
	Fri,  8 May 2026 13:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778239307;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=O6MTfOFVWEkSUDTe+Tl0C8qDvu0XyTn3jt4TNMswQuA=;
	b=FQ2270znWepd4TScypSZ76Ew/0uOxqRSPjSkJFYqi+dJtEuAsHP4rS5JrV+E9tbR6JHfI3
	w8VpVKL9AoSk6lqLkbQrq5r0DpBxy4rGe923RgstnIpVrD3E5uuo6pBk+gS83TcrCz1fXm
	g17YPI3p5M1kbm4yoYy0wnYmrcBxHfU4Cr+nXO8CPK3fVuLyQ60HhomuwT/50TXKE4FNtS
	/8OXHiF11A2DVGYvWPI0gc7m6sBKERRtbctST5EloZWKGlX8XvVXuXZUPWzcXoGR1KhWga
	OR4LrXojySWO8RqEFGxEGJLgJM+ZXQ9/oFtnnF6OGAQGOOT/uuabopoFGGHGUw==
Message-ID: <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
Date: Fri, 8 May 2026 13:21:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260407211850.79881-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/7/26 11:17 PM, Marek Vasut wrote:
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:
> 
> - AUO G215HVN011
> - Innolux G070Y2-L01
> - Innolux G101ICE-L01
> - Innolux G121XCE-L01
> - Innolux G156HCE-L01
> - Multi-Inno Technology MI0700A2T-30
> - Multi-Inno Technology MI1010Z1T-1CP11
> 
> Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
> iMX8Mm is not a typo, this is the adapter model string. The adapter was
> originally developed for the iMX8Mm eDM SBC.

Hello Frank,

this patchset is now split. How can we proceed ?

Thank you for your help!
