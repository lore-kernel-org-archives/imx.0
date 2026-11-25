Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595008;
	b=f2liz4poqTlA6ASFwu2+I4PJzrIIK0agkeh/HzEsrgu2i0M1Y2swWuVbGH+UbVa35k/X
	 UEGevAsYkGoPcMbIg01C2ZecqSssr0tTCRyTmczTo/Vfe/jFp7AA0VJJev19Olo1qD8NI
	 RjH//vkCKdTfmSh0i462IPQEv9PFGiJmafXFowfsMr9hNhxlx/XDDRmzRWuj4sju1wQqh
	 Nx0Nodf9zoDGdOtmZ3A9hzRkL50PWu8xnm2cZ8cJjxXarxuHoViNXpKRJtwTN3vhlyvlX
	 6QIOo8llbo3v7WoPIvT/Ara5xKvY3P6nHF+2V2dkTPP6lL5TMQuzyDo5vZnrGOfgqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595008;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pcVu9EMSsefYLymrQtl8LupCbMPRgg6akpslMtZ5jus=;
	b=hHq1Vi5QLBWDNOZpl7blWpt7H1Rn2tXTTwxSLBzzusIWmR8ZUnjAwMQmGo7k+CHoEh+l
	 6iki9LibvDVSsgzT+dFJ6wup0+RwGz/aR70DIi2NfvvM/z7H293cOpa1vFNdkzw3V2KtB
	 T4nw6yPbSK/rk0t9Lx3ha6yg8QabpcCKyyXPTgDog4rZSZZEHkKuzUuzyVBFzduyyvpo2
	 CAJ0RMvsRalLceFP7MK6w5oah0iDtiFgYcy61RhXFtW+kfQkRDB8Ej6GuW9maDs5rh+/g
	 noR+7DAYOgLx4/ZK6CUp5u5fPDLxHIJW/A1/vBZNPkCKsgNSyWNwsbYHJUmGzKwAXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAXXIOSd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCD606A31E;
	Wed, 25 Nov 2026 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAXXIOSd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9361F000D0;
	Wed, 25 Nov 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595007;
	bh=pcVu9EMSsefYLymrQtl8LupCbMPRgg6akpslMtZ5jus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hAXXIOSdeCMZpSaXr6Prsk7LMFY3xIq8/4v7hVjMGlmywb+hy8GiNBNhJahumPLQ/
	 post4M/F1MOvUHIZZsPwVYMITfdk5TUgi+dJHYN0ok1UkNWXWDIpR9sV/NCggX4gDb
	 CPdYBbtHq8N/cIXuYudDi1VFvx8h7cE0Y6DIcSPqIlFl+RvtVSe1/RlWxe5MC4trvV
	 A0KhEtBEZWa4smxg7X8OGgyxjBXur/KBaQCJQ4S+Uwk9SjICtyIkUbeAwsFH5h54Wn
	 IUK/X3aEkXhQIBrzZA48ltJcOCj2gq0SGVeLXmBDAbi+S75MMK8yZLRFeA6cnD8all
	 yedaSNiEhahBQ==
Message-ID: <5f86acc5-5774-4a5a-b60d-1659ee2f7725@kernel.org>
Date: Wed, 25 Nov 2026 08:23:24 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
To: Stefan Ghetu <stefan.ghetu@nxp.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Christian Eggers <ceggers@arri.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261125072736.769516-1-stefan.ghetu@nxp.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261125072736.769516-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/25/26 7:27 AM, Stefan Ghetu wrote:
> Avoid getting error messages at startup like the following on i.MX8QXP,
> i.MX8QM and i.MX8DXL, printed once for each MAC address cell:
> 
> nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4
> 
> The same was already done for imx-ocotp and imx-ocotp-ele by commit
> 48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
> SCU based driver was not covered.
> 
> This shouldn't cause any functional change as this alignment would
> otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().
> 
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")

cc Stable is missing.

> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---
>  drivers/nvmem/imx-ocotp-scu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
> index 20312fba22d23..80f78bcf3841e 100644
> --- a/drivers/nvmem/imx-ocotp-scu.c
> +++ b/drivers/nvmem/imx-ocotp-scu.c
> @@ -218,6 +218,12 @@ static int imx_scu_ocotp_write(void *context, unsigned int offset,
>  	return res.a0;
>  }
>  
> +static void imx_scu_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> +					     struct nvmem_cell_info *cell)
> +{
> +	cell->raw_len = round_up(cell->bytes, 4);
> +}
> +
>  static struct nvmem_config imx_scu_ocotp_nvmem_config = {
>  	.name = "imx-scu-ocotp",
>  	.add_legacy_fixed_of_cells = true,
> @@ -227,6 +233,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
>  	.owner = THIS_MODULE,
>  	.reg_read = imx_scu_ocotp_read,
>  	.reg_write = imx_scu_ocotp_write,
> +	.fixup_dt_cell_info = imx_scu_ocotp_fixup_dt_cell_info,
>  };
>  
>  static const struct of_device_id imx_scu_ocotp_dt_ids[] = {

