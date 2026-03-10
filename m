Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B338D6BD
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773151370; cv=pass; b=Mb8v6EpTIxdf16PR9Qu9PYWdBPp3Tx35Aj4n4PTY3x5Cu7jGWHrM8W39U5wVT3TCsOPaoGVkr3HDq9nxrSgpOPo3Ordhwqqy4RD4nfxGHm17iq4hxXND5WIrGw94st2dId+QQWi5QuxGdOISmO3nhkJW1aapCLXHc2pbbB++9I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773151370; c=relaxed/simple;
	bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJJsxSCG64fS4ePpsajBHLzu4BlRlcrXRAehkQ9Rrr/ggE/r3EYJhT4I/GPJQD9sJfr2kzsp36JfgqX+1CECTKdIrOoG/9CPpMdCim7+NA0xrE9SJRlFs+VRAY9UAbYBJL4stqHB/GvzuQyQSYLJZ6qDnNhKpl/P9DWuAVbETXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1yuxP4M; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1yuxP4M"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so7399153e87.0
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 07:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773151367; cv=none;
        d=google.com; s=arc-20240605;
        b=UA2CQj1PrKEn/Z22K+/gKmfLq7mLpaEQohUeaztMzq+/1AkRPw22+Gmm3MaBEfE2QA
         /uSdWvx9463XHoH8tTLxAyvJ7L6rTlP041KNiY2yh76bpMGABGGLPgFKOpQAodm/uiOS
         W1om3nJ01CdPDeol61nXKSiLV5GlxWKjUyd2BSLqvbzM0eGpBdl3PthRSr4M164MOnZO
         xr3JgkhmOxA8WK7Uv28AXRBzbKEzWUHq/eD6T6dC2gmCPWCXeqEY+87b6jB8vEZNMU5K
         TcCFVNibPHbxlSt+c8jQg4OwRxj2w2P6PTBvIs+TgWSvuz6WAWNpjpE4ruXMqKP0RY25
         NRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        fh=wnT7sKPFlySk6xcLUy/QZeSqRBBbR72c8157X28GMS0=;
        b=XN9JAXgXugy6A/CZ/d0oeXj3iDJ/hsZ9N5/JZYgTMA8fGo3K0Oi2QGwIt51XvFvPsD
         +05RV5AC9wthzPpQWSJq331APyPKbRBFlcqWYp6cBqSdY9ctK2u7N6CFs4E1adgmq6RY
         dbV9BrB9/+H1NLZNtbhhriY1W/1/26sTZJiyH2/SC758aCoJKxYAEH1nHjLmXgVwFtBk
         +d6cfLOqVBOUj4oWpcBhK7kWj6bLUC3mNt3ZtKI/Wv3hHGH0f+2ZyKXNBlyBKMX0bEWl
         PfK4bp3ZN7+BjLZFJfmqm6csWz+INYPHjwuG8k0i5laZC4UPrIvUUbULJ5AEk3ljErx8
         p6Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151367; x=1773756167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        b=k1yuxP4MdTF3rELYxaZO8AiHwNx1slmN7vbOez3hy9Tlz9J9wSWCSrdIV5kfwbNX00
         xNDkvHZxBVuT3CMNatfZH/4hCWLcAiGglR/LHrDyjXODQUZ617stfkOpVmExiD4eJBro
         lyePiIz2zCI555v+fKZX+GM1qFDIDRwnpsCz72evQ+dxvwac5sPMh+pHFMs0b8EOv97V
         4n/d3wIQpHgFQU8CBnCOH7F5x6c6EjKp0DglPlKV6zW9BlACOd7s3DbdAFZxa5s4NSKG
         X4L1IrLthKlKQA9mcXZf4t9BlqjcMOW7gjeTosypYUY7rpOCNTUJ8UdG9jx77N18ve+C
         q8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151367; x=1773756167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cjMHYImNRSSja4s6HqYCd0m/oShCUOYPaIwWGsmcTM=;
        b=rxcjqAqQDd/YhIC6oe9Mwv4wtButlQez3VwiYrTj+jxrAxnkY8k+td7zmkYjYyS4MD
         q8a88X9hnmuU8dRkQu+8WpAlHRsBf5/rLJOnhetGY3DKULoLwR0+zW7By6xBdqcZ4SnG
         8c8EBe/XHU+gXiDYgEaqbo0LRTytCJOyC87q+6IqrJ9oT4pUEoiGlcjZPY4ne3Uc+Kng
         R/Gyvz4zrWLd8yhqdTBwdG/OiB74lGMw+TbCpwEFwxOzXvtf2TSirF7xAKuRLe+wS5P4
         RHfDobCIynleRSbQWLvUMhf5gDJ/89bPCsidptPKIpH9fIB8QNW85Yjzvj3TGxJPn1Ab
         tLZg==
X-Forwarded-Encrypted: i=1; AJvYcCVsr1O/rJtqmZtCvgz7k7Saki63NH5dSvZSJ51KMtEv+GXOKpjaTfgdiT2gcSehdXQEnOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKRkaGGOlWseN5uiyN5PPP5smz7YRQ4SexZmNwFPkpI4ma90lz
	fGzu7kjwpKAYGjyWdQIHCbeVOJDCdb9bAO7TfV/cAMxJawj0wBMjMR5C6+V7sZQVLUfNWmGmhfd
	F0IapKulgJ9ALNyukrQ4Q5yoNa9A4Tf4=
X-Gm-Gg: ATEYQzwAk0GP5R1yFevNvSJa3zSj5qH57gBoPeUWlc4GtGGBC39rbl2urkkLUpUcYU3
	SnC9Tukg/I/gkSRZYDKIrbpz9n4abhQ/sETmRwQuDqPzCj4r+LhH7EwUj54mfMDpc1g/EmMWbFT
	h8e+vDpykvREnEYWWErib0b/8Ssm+rEYTmNklezBxiYP7CSFnn4q/Ea6n6k35PFlqQbjg//oYHn
	/b+RjxKDxQtk98TPvWYFTC6Y9lTG7hT0nN8dcA33IL5/7eZfEde88VUIGaqceuK7FY0CmNOAYXF
	VTYbrJm6THWd2l8CZzvY4ZJZVs6ZbkaLL0ntxslKC3UuLWlQeIJHDSay1ggOfd1HNMbPgw8=
X-Received: by 2002:a05:6512:63cb:b0:5a1:5305:74c9 with SMTP id
 2adb3069b0e04-5a1530575afmr52626e87.49.1773151366877; Tue, 10 Mar 2026
 07:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310124950.1345117-1-andrei.botila@oss.nxp.com>
 <CAOMZO5BVtRHW1+qtMEH9akO7ULS3LppzGXMB2_M-JJVwjbv1oQ@mail.gmail.com> <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
In-Reply-To: <67e082c5-2b34-4960-8fd1-6cd007e0584c@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2026 11:02:35 -0300
X-Gm-Features: AaiRm52bhcWWMfREEMDJLPaGrxzwDMESu5gS0-COwtzMY13DiIy4Ieg-CBISC-g
Message-ID: <CAOMZO5CHGssc3Tuf6fJg2_P=bp7=itfDVRANqQOiK2b-2ooeFA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: s32g: force S32G RTC as rtc0
To: Andrei Botila <andrei.botila@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 10:50=E2=80=AFAM Andrei Botila
<andrei.botila@oss.nxp.com> wrote:

> Regarding the I2C RTC(PCA85073A) commands like hwclock or rtcwake use by
> default /dev/rtc, /dev/rtc0 so they will try to use PCA and fail.

These commands should not fail.

date -s "2026-03-10 11:00:00"
hwclock -w

Power-cycle the board. Does the "date" command retain the correct time?

> Also from what I could find online PCA85073A is also not battery-backed.

I haven't checked, but this looks strange. How will the board retain
the time then, after a power cycle?
