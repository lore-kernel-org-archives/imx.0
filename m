Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23F322557;
	Fri, 30 Jan 2026 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791405; cv=none; b=L3huTVYJPkIevUJJWssZ3ykRV9f2RzIbhGLnIfevHtmJ7Ko8rEDDHKnrQVGtfRfAmc7Pqft4tqmIfzsbszI/2vrsLLrx+9Me9bIVjOVCd9dHI2lUm6z+W3Dt7Xbal/QdZs9MVTtuk3ABdUXbA0+YDbxkjmOoJXQ/FGT69NkieoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791405; c=relaxed/simple;
	bh=tXAL+Qg+AltobkuOnMSRrqShGxkMMFxiMYL7xv6KSWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JOhiNJ22+FVWxnoPsTEr6Yw8LOtGbwrq/wNYbVGuhaSdqu9D/Tvzvvzpv82VM7fIWpV787/q71A+ZI1VoE0VoWq645TEHakNvfOTj17jet1/c+VGs0Dq3cVBUw6zIK3i8t+uiZglqq7ie8qc8gsNwHk6yoNG1avyEovRw6xiQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqRl1P/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqRl1P/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E3C4CEF7;
	Fri, 30 Jan 2026 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769791405;
	bh=tXAL+Qg+AltobkuOnMSRrqShGxkMMFxiMYL7xv6KSWg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RqRl1P/KlB+bF+MSGSpgrkei4edZCuisiiC4yDV7cSABYaMgH9JgDFoSBSs3/koLt
	 wUGvzDKRWIinYD5LHPGfTLaru1iLEXcS2jMkmPiXCLgjH2rmq9BOkl6e41TS0v09IN
	 fSimbrypbVOCsWoehgbhn7zQFj5oMmtL1j4o4gYYaw1cWbwcK89XK7NCGrs29DXg5F
	 w2FFaGUyIF+5tRSbiR6wBrrJDAux0SZUxPEx/IsYd2mOcSYJmIiZImK7rQ4MpUSzq2
	 6siDU7zkx79TnXJeqvUoDOlySx7nP3ndGdOLIq2G6PGRnmSgcR1XuH8FiII4ygnPcP
	 7K2nJONis0J7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Bough Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <DU0PR04MB9496760AE1881329E33F0B7F909EA@DU0PR04MB9496.eurprd04.prod.outlook.com>
	(Bough Chen's message of "Thu, 29 Jan 2026 01:56:40 +0000")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
	<DU0PR04MB9496760AE1881329E33F0B7F909EA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Date: Fri, 30 Jan 2026 17:43:21 +0100
Message-ID: <2vxz1pj79hli.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 29 2026, Bough Chen wrote:

> Gentle ping...

Sorry, this cycle I was really busy with some other things, so I didn't
get a chance to queue any content for this cycle. I will start queueing
patches once the merge window for the next kernel closes.

>
>> -----Original Message-----
>> From: Bough Chen <haibo.chen@nxp.com>
>> Sent: 2025=E5=B9=B412=E6=9C=888=E6=97=A5 17:14
>> To: Tudor Ambarus <tudor.ambarus@linaro.org>; Pratyush Yadav
>> <pratyush@kernel.org>; Michael Walle <mwalle@kernel.org>; Miquel Raynal
>> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>; Vignesh
>> Raghavendra <vigneshr@ti.com>
>> Cc: Pratyush Yadav <p.yadav@ti.com>; linux-mtd@lists.infradead.org;
>> linux-kernel@vger.kernel.org; imx@lists.linux.dev; Bough Chen
>> <haibo.chen@nxp.com>
>> Subject: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when ch=
eck
>> read operations
>>=20
>> When check read operation, need to setting the op.dummy.nbytes based on
>> current read operation rather than the nor->read_proto.
>>=20
>> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
[...]

--=20
Regards,
Pratyush Yadav
