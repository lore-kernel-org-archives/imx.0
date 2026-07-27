Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6C35C1B0
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182765; cv=none; b=hZkuyaXc3waHhxAd4A3e4zuTUAEIM+9sJWQuoWOtkdScyUNAmeqQgCG1DxM6Nch656cjk0ZDxfkIQ5uIzSS9cnEvIMB4ZH9nuKDfcA9LTFVne3NPb1ib5xIU86+XBaE4n1NjVPuDibroNoDE4j27b+Xotx5wcmb+brh6ipg7tY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182765; c=relaxed/simple;
	bh=XcvXLQlxS7Pr3e57S+wBcJe00z1ahG1O/bqchT3JOHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sqw5AdKDBoAS0IOWeSoChU5GwTlj0BfN0DLhYgv8XfpO90easMY1JLASX/VTcp4HtyXni7WHZKs03A73Q5wHUt9vmDrpUrO/eM4Pnh/BVEo1IWZIOZmiv5TjdByrraU8geb9pH14cQ54ls7OHgn+KkZeYOM04dcXIemrB7eFiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=VxpQgskq; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="VxpQgskq"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1woRaG-00000001H20-18Yu
	for imx@lists.linux.dev;
	Mon, 27 Jul 2026 22:05:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=NspwG6ABO/FYOE9rIEFlIMurhhb6P0XuMLDrCAYAYl0=; t=1785182756; x=1786392356; 
	b=VxpQgskql8CtZLKCycwH8kn20NkpEqo7auBZgAVwW6c6xuXLuPCbibut84Hi5OARqxyTAB3Sgnh
	iADib5X0DNWQSY5OJBVRnNr6t0ZX4hTlI5oasDa0z2Srsej0/k8zll6UIifb8XJwK+ujFEC86KYlL
	Bl7UzaXdR8gJuh+8i5Gou2pXEY2Z5ntjcG45wK6af/RlrzghXExUL6Bc4TTzm60lesa8WaI3vIJJs
	Lg71eowZeYdoLmjHQCoqXK79GF1QVmLZ8lrl5YRGzHZmy6YQ/NICF4/Z9SvTUhb9sGXTX5pJluA7q
	iGmYUtZYcOkGzbp7kcXKVc/z5n6Je6iC5kEw==;
Date: Mon, 27 Jul 2026 22:04:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: robby.cai@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector
 table
Message-ID: <20260727220438.2a5bf1a8@akphone>
In-Reply-To: <20260721095959.1855436-2-robby.cai@oss.nxp.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
	<20260721095959.1855436-2-robby.cai@oss.nxp.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 17:59:58 +0800
robby.cai@oss.nxp.com wrote:

> From: Robby Cai <robby.cai@nxp.com>
> 
> The VPOSNEG_table[] mapping does not match the FP9931/JD9930
> datasheet.
> 
> The datasheet defines the VPOS/VNEG voltage mapping as:
> 
>   00h-04h ->  7.04V (-7.04V)
>   05h     ->  7.26V (-7.26V)
>   06h     ->  7.49V (-7.49V)
>   ...
>   28h-3Fh -> 15.06V (-15.06V)
> 
> However, the current table maps selector 0x05 to 7.04V instead of
> 7.26V, causing all subsequent entries to be shifted by one position.
> 
> Update VPOSNEG_table[] to match the documented register encoding.
> 
> Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
