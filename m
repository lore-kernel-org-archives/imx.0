Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F11917ED;
	Fri, 14 Nov 2025 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133267; cv=none; b=d2cNVNjw1jETYFGDal2L8X+hE3GFJ89FsjCWrQU8Fhaqca/1dRT6S8hv9ZEYO3AFbugle14HkdFgUIsFQ7noEhVgHIwXGb9i65dWi6DPrdJ9D1Eicc25Ey4niCUO9jpRlN+Riium3y6nhwn6hEkGJUlyOXZ58o3d5WwunPq1zlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133267; c=relaxed/simple;
	bh=D8PBCWGceZcRoTf8sqvXnJ6wWhPoF7TXNW7mHGjQzcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SyU1ZguGsZX0POeG3lTi2FjIMV8VRvpLDUdgZIcvgzGbf7rOBCuM86bLFkz8AozQZ6yt3CGm2/rRI1Ajm98+lAC9ktGYdtuPdQzfX0jRN7DjLrLmhCMOJRKqxVCuNVmy0qwOnQ/dPeoluork+abXMWt8SMOgNcutcQQqFYB+wlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEeR7way; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEeR7way"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEDBC4CEFB;
	Fri, 14 Nov 2025 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133267;
	bh=D8PBCWGceZcRoTf8sqvXnJ6wWhPoF7TXNW7mHGjQzcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sEeR7wayvKjx57rYbjEy+ERJ3r03RHxnkoH371bvHG0GROQSiZqZvhoucVG6/hgDL
	 BYkCg8dESvpI+NwsedTWunux/C/NzxUapma3Dh1HAllf/+QYpYaFdYdNG9407m37m7
	 nPoHNgQIullGExvYZqcoLxYvXTJvAXxcfTl9t9IDx8t55dG5fZo6ejpwsEJLBNT13S
	 7N4yoj2RCibkmG3+ZTy7NoRDTKtOxSxwp2zNrhr8jHuKxA0gYeQ2UbFA9bNv0rO2fv
	 BMEGaAIS2svp7k47/EBitqsNzwZKn+jiSX0nKx55LiQk8msewheYU71ELvW97VMy27
	 UoUl8GNUn5c7Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Haibo Chen <haibo.chen@nxp.com>,
  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Subject: Re: [PATCH v4 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
In-Reply-To: <a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org> (Tudor
	Ambarus's message of "Thu, 13 Nov 2025 17:42:06 +0200")
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
	<20251112-nor-v4-5-e4637be82a0a@nxp.com> <mafs08qga9ehe.fsf@kernel.org>
	<a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org>
Date: Fri, 14 Nov 2025 16:14:24 +0100
Message-ID: <mafs0wm3s8x4f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 13 2025, Tudor Ambarus wrote:

> On 11/13/25 4:47 PM, Pratyush Yadav wrote:
>
> Hi!
>
>> On Wed, Nov 12 2025, Haibo Chen wrote:
>> 
>>> The MT35XU02GCBA flash device does not support chip erase,
>>> according to its datasheet. It supports die erase, which
>>> means the current driver implementation will likely need
>>> to be converted to use die erase.
>>>
>>> Furthermore, similar to the MT35XU01GBBA, the
>>> SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs to be enabled.
>>>
>>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>>> ---
>>>  drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>>> index c89c06b1fc61a581fea2e18732be2501a15715f9..f94e9d2d17bf4aa7c36ba3aa37d34f767a9f93ac 100644
>>> --- a/drivers/mtd/spi-nor/micron-st.c
>>> +++ b/drivers/mtd/spi-nor/micron-st.c
>>> @@ -204,6 +204,16 @@ static const struct flash_info micron_nor_parts[] = {
>>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>>  		.fixups = &mt35xu01gbba_fixups,
>>>  	}, {
>>> +		/*
>>> +		 * The MT35XU02GCBA flash device does not support
>>> +		 * chip erase, according to its datasheet.
>>> +		 * It supports die erase, which means the current
>>> +		 * driver implementation will likely need to be
>>> +		 * converted to use die erase.
>>> +		 * Furthermore, similar to the MT35XU01GBBA, the
>>> +		 * SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
>>> +		 * to be enabled.
>>> +		 */
>> 
>> Maybe I am missing some context from previous patches, but why are we
>> adding this comment here instead of fixing the support for this flash?
>> What does "the driver will likely need to be converted to use die erase"
>> mean? If it doesn't support chip erase, then it _does_ need to be fixed
>> by using die erase.
>> 
>> Also, why does the flash "probably" need SPI_NOR_IO_MODE_EN_VOLATILE?
>> Are you guessing based on datasheet and do not have the hardware at
>> hand?
>
> Yes, no hardware at hand. He can test with mt35xu01gbba which is a smaller
> flash that share the datasheet with this flash, so that's why the TODO
> and not a direct change.

Okay, fair enough. I think the wording of the comment and commit message
are kind of vague though. So I will do some massaging when applying.

[...]

-- 
Regards,
Pratyush Yadav
