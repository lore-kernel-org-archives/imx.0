Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F91D7995
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 02:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762221902; cv=none; b=TZGcYGTDMVkl0N6epemTQ6R5P0DVQCcDXYetB+EfuqPttcEtMcMO3/9WIiTR6IidfODxzfBQhAI1beeWL12/lfLk6Yy393abLZ/2kzB8Ce0it8iOFvV3GvXgxw+itMyJ4Yv+hDiRNjLoV1K0mozSpqVweZb6M6u7UbwNqxqInjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762221902; c=relaxed/simple;
	bh=VQ6ZbWc/+0kA0XArRYwHD1GETvoyhwhdHwWcUTKzdBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XjgRYlK5J4s7YblYfoAZ7R6OjMAugd1VDRUnPYOOx+H8EnSsudNSQWjYZswfq5aohNS49Ia+9UXQkMusZmasyyAaAVUlTIfbt0zd9SfBAo5RbU3vbePzZ3IEUQhTu96ANdT2RxqsjEMOc8KfEBJo9lJha+x0FXphIerpJpJ2DXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RtgfVc6B; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RtgfVc6B"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0sGd5r2Xz9th6;
	Tue,  4 Nov 2025 03:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762221897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0yWbu7y1QVa2c8kKeP3bloSf5n0MlRqUOGmDNRFYWs=;
	b=RtgfVc6BU5L52qXx6mbD7p7VtqF4yj+yLn55bS3cm5xcC4cm9RS19rhx7NeFUYWAsg8KpG
	E8A+X2LgR4HdJRRXGiyl6zt3aCz38ZsfLE+ssHatAOXcdM7+29FsSUW0WZm/yzWChe+XDi
	CRF1VpVsx8xqcG7FVeD38C3U9unZ3XbB4ys7Df1kL2e8DEj/nEN2BW+10XY0v4sCkzO+sH
	gYbSDjqwNPHG0/Xx43THSDWf0dE0uXHBdTBAdxr1q40ImSVqONPKXIiYQ8IjrDq0qdSjnV
	7CY3eG+avTc+gbbY66ug9hli5gN7Ix4L/Ig5Pc18wCXOfMyYpptResjQWu9RzA==
Message-ID: <b8f61be8-281a-4057-bb05-c7d106e53f01@mailbox.org>
Date: Tue, 4 Nov 2025 00:47:58 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: shawnguo2@yeah.net, airlied@gmail.com, boris.brezillon@collabora.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org> <aP7DZCMk1pQ7wsFo@dragon>
 <aQB88c_AEC1RAZtH@oss.nxp.com> <aQCIAfyUC6N5y2fB@dragon>
 <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
 <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: azhnsga89ktmxpihnm4emkymm3cay3uo
X-MBO-RS-ID: ab159e2ebd1e51d8cf5

On 11/3/25 8:46 AM, Rain Yang wrote:

Hello Rain,

> thanks for your patch to make i.MX95 GPU upstreamed.
> Maybe I didn't express it clearly in the previous e-mails.
> the always-on GPUAPB clock must be removed, otherwise, it will result in redundant and unnecessary
> function call to M33.

DT should describe the hardware fully, that means DT should also 
describe the clock. Why should this clock description be removed from DT 
? The SCMI clock call over SMT transport is cheap.

-- 
Best regards,
Marek Vasut
