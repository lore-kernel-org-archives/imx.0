Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD11CD15
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264257; cv=none; b=aMjb2EZXSdMcMV0GV28KN7+FDbw1MgVhUl41ju9Ia6I1nbh6+zveKP+e0g6RbgncyMBVtS+4Wwh+j00QAMLb13Z//XcBfoE3OcYvgfL1spdLWcoTYpUuxKAbY3sTrX4fD/bSeqYkSb2w3aRU18vhxqfWCdmIYKlPDxFjaH58ADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264257; c=relaxed/simple;
	bh=0a1a4wJl0mNN+XeKmiOrjUVWC1hr2y3wlT7/+yelLHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhKBFY+PPZdWasEwn6dSYbMB3TGuGkCgohDyiOiJglCZwlMPIKfPE9BP/uwSb3zcHlAuJYCx8NtNMl/v2gmvacmSVq/lks6AuAoxUl/7k0VMS8tBkm4cvTAaS9WJbk0PX1wERLaVpyASYUEzldLRrmynd4Bk2nJoMZ1ON9ZyC5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Rw+EH5Ht; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Rw+EH5Ht"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78118e163e5so2442347b3a.0
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264255; x=1761869055; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=st9SBmAbK+pJ23fMLr1ycY9DK+4vkS9Hx7Sl87k4JR8=;
        b=Rw+EH5Htl++LdSbhl5N1+KsG/DW5m0T8HnRyt55DmPe7/2MZwdnPYQ5rhTOhACL4cF
         s1ANTh78NSEQpzDFV1mCjrXemyNuWgwEaIhNE0ADkytjPBoeZvq5y97LK8Vsm9pVYBI8
         0tCn/+jD7qNwYu/8aLgSP4REDxBrDrte1N+gCnyYmjJu1vhxFVm6mhG4Okgdmc4gVnD1
         T3tv6nmnyEKSgIBROcSWSHAqKMiwvAZ5S2fmXcmHJYHvSYiiV0/z40xij9jVzKoooR4x
         W91efr2tkC6q/clPCydqXnf4TCWHPXUOMDEi9jSQgWhSKwpB2p8bUiZpkvk3zC1l9/Eb
         CvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264255; x=1761869055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=st9SBmAbK+pJ23fMLr1ycY9DK+4vkS9Hx7Sl87k4JR8=;
        b=hAQnRgqWpAZv8qtef6jI4w0J1bM3NjGSBQKBYCOEtJCfeh9t5E3HA/ICEFYpNwVtHK
         I6HsxSCmoCJZDP09Lock8IUBwfjA0OVrPzwgzNMqFbuUitrBfz7l4uNhSK64tI0XjLP3
         aQ+7wb1SFN4g6v1/M+QvhSE+JzcnYpDiMj29D1J17fpfN6wkdeSeTPD2oUzXkLOtqdBW
         EtQowDRoEKZ8mEvg3oILfkZ9jQ/nU4FRmP7/IRCEiZMOKL4v7AltOaGDFbtulgFy7GK0
         00hfjChCPlTBR1+owSKZ8WBc5AW6DdLbwnh/ARuQGsI74WDlyk0vaO7VLnwFzOKnsGmp
         ccqg==
X-Forwarded-Encrypted: i=1; AJvYcCXGubMqW1eKSwEr6Bs2y6/gc/3ItJc4rXFNEK0DXR4rPh4O5JUZxEuIt35zO1negt1158M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhcexLqAJaE/pI39ceLtZtBrb+1L2PgUd7yLYKHqJRc6wKI9QA
	A5kMIp5Ko/1UvPdUbwADF6pPsXVI2M//Y1EhHUWBxWby5eBfzWjCjYBwqsiO3IjufD8=
X-Gm-Gg: ASbGncs2mFSMcuwMMx3x8H+kyrb7LqNkRXq+/oONG6CtqzZtn8dxXo4CMZhePv+Av7z
	5/D1AIW7WtrhsPupJDvg77q5QZmsg/u6lJ404Y3dfuBjXoH7QxZHnh07Z/gdZq2i4jL6yAeCL8F
	epAW+gMBryRHwX8H+Cc/d5BCAgZB+MqlY9tHsgnS4RbHxnKBxbDdj0CGkP8zlK+qbRQQ61wuGtF
	0K1s08MORcAuvisndYTPugciwhrb5sWfnEFj9/ro+R8WS4F25MQ4WvMIeVqPPbn+AwWowOPa7aQ
	0QfvtrqXbPnm6kSQUUg/iIozrtGNmVGMswdRtpzOxfffa3w9i+U/oG5nLKh5wvev793CIM8aStE
	1jZhcR0oeh3ugjZGvaf+NcLsd56uAtCdkd+tXkXdMJaPgMRyBIhzNWnuW9I9IT+oimRkaP4fu8Z
	aDVGCs4FRvpDmJ6RcnXhXXlV4foaQ=
X-Google-Smtp-Source: AGHT+IG4cAqt2nwKmVZj2ECX6/woNYxm9obKHW2gmp+s3pOMBjf8gp6N1gNa2I6RxiJ8JXE2VP7MyQ==
X-Received: by 2002:a05:6a20:394b:b0:2c2:f61b:5ffd with SMTP id adf61e73a8af0-33db34e5145mr934623637.10.1761264255098;
        Thu, 23 Oct 2025 17:04:15 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:14 -0700 (PDT)
Message-ID: <aa306536-f09b-414c-9e6d-0b69d69040a4@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:14 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] spi: fsl-qspi: allot 1KB per chip
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-7-elder@riscstar.com>
 <aPq8ibj2KzQhtYQT@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq8ibj2KzQhtYQT@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:38 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:18PM -0500, Alex Elder wrote:
>> In fsl_qspi_default_setup(), four registers define the size of blocks of
>> data to written to each of four chips that comprise SPI NOR flash storage.
>> They are currently defined to be the same as the AHB buffer size (which is
>> always 1KB).
>>
>> The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
>> four sizes to be multiples of 1024 bytes.
>>
>> Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
>> non-zero, will be used instead of the AHB buffer size to define the size of
>> these chip regions.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - New field fsl_qspi_devtype_data->sfa_size now defines the size of
>>         the serial flash regions if it's non-zero
>>
>>   drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index c21e3804cb032..a474d1b341b6a 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
>>   	unsigned int txfifo;
>>   	int invalid_mstrid;
>>   	unsigned int ahb_buf_size;
>> +	unsigned int sfa_size;
>>   	unsigned int quirks;
>>   	bool little_endian;
>>   };
>> @@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   {
>>   	void __iomem *base = q->iobase;
>>   	u32 reg, addr_offset = 0;
>> +	u32 size;
> 
> I think use 'sfa_size' is better to read code.

OK I'll rename in the next version.  Thanks.	-Alex

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>   	int ret;
>>
>>   	/* disable and unprepare clock to avoid glitch pass to controller */
>> @@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   	 * In HW there can be a maximum of four chips on two buses with
>>   	 * two chip selects on each bus. We use four chip selects in SW
>>   	 * to differentiate between the four chips.
>> -	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
>> -	 * SFB2AD accordingly.
>> +	 *
>> +	 * By default we write the AHB buffer size to each chip, but
>> +	 * a different size can be specified with devtype_data->sfa_size.
>> +	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
>> +	 * top (end) of these four regions.
>>   	 */
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
>> -		    base + QUADSPI_SFA1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
>> -		    base + QUADSPI_SFA2AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
>> -		    base + QUADSPI_SFB1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
>> -		    base + QUADSPI_SFB2AD);
>> +	size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
>> +	qspi_writel(q, addr_offset + 1 * size, base + QUADSPI_SFA1AD);
>> +	qspi_writel(q, addr_offset + 2 * size, base + QUADSPI_SFA2AD);
>> +	qspi_writel(q, addr_offset + 3 * size, base + QUADSPI_SFB1AD);
>> +	qspi_writel(q, addr_offset + 4 * size, base + QUADSPI_SFB2AD);
>>
>>   	q->selected = -1;
>>
>> --
>> 2.43.0
>>

