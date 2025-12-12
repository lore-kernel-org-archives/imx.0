Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D2145348;
	Fri, 12 Dec 2025 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524025; cv=none; b=Sbz6/tOa1+vw9GHg9C0PGysZAy6uWczy3jmaSn3YQ3UPScwJ2YPcUBZ5RlpT0fc4JWN3k7681qw6LK5JndmG860qo8dxc6qnLYceWmbjdQcCks5egjIs0WPjo2eFqj6IPlT0eXeqqFFu1/LriZkKdUmHZSrFBYkMEZyCMZZO+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524025; c=relaxed/simple;
	bh=dhNhFtOI2xytRXsi6ATgp3idSIXBWLJxXg8Hf/TiTBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ogYqORpzFnamI+PzlV7vKSq3aJsbA177ZWRfHnEr1fRYBNe/MTIkFwAksyXd5YI0qz59jAFZAEBZDOf7ASrFf2uKseD6lYGo/byGWTxFMFjL0fflANzXKZM97YQUrp5alzy4mFoPvo+sJ4dJpBH3u0GoDeW7MsHyIPpT/ZIV40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVe565xz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVe565xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0EC4CEF1;
	Fri, 12 Dec 2025 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765524025;
	bh=dhNhFtOI2xytRXsi6ATgp3idSIXBWLJxXg8Hf/TiTBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qVe565xz7Whzbp2GCcXbvsYKu/hOsrjvXDkfIiaxq7DHmdDiicLgv0XjMEXshJ3Hb
	 A3NVP7m1rbD+owmgm9zHlxUaeoCW98YxRyGabo35xk+bgRz81HqoE8+Cn27gTSXy8F
	 72hzgSDmztgteO8xW6DdGJ+oxPtlTvehBVzJM6xDdauseV+koBMM43iy7WKO4Dk6h1
	 4ryJbL9gaBNGt863U8OCK2n+Nrcu3HmcR4aUSTVwyqkyuBvPlDXcrFkOWOlHWw3WnR
	 F7mhJCKJsTEtHam/Bj20NwKg07HCTkQntReJjcow9FZs/oJWuP/DYHKAW8yiRe2bcg
	 XqqYvL8BEKvug==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <20251208-spi-nor-v1-1-f6669a645395@nxp.com> (Haibo Chen's
	message of "Mon, 08 Dec 2025 17:14:14 +0800")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
Date: Fri, 12 Dec 2025 16:20:19 +0900
Message-ID: <86pl8k6ua4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Dec 08 2025, Haibo Chen wrote:

> When check read operation, need to setting the op.dummy.nbytes based
> on current read operation rather than the nor->read_proto.
>
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
