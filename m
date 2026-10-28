Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153486;
	b=qsEwc3ufiF4Sr//RghXLqpbz1388gpnR95w9pP/vI/SSazcpeGy39kinJcV+n83RHeQL
	 hKijib1M3VfHVm5SoUw+847fvsNQhaGfjfN2LqsHomCEp55VMhVGQSMhziHhOYDy0lHYP
	 cJ9I8keozwEXHQ3KIO36mL2cNgb4CBnnkF0UEezNwl5C/GGpU+nIDc9XFIrNgSqw8enbk
	 gWwmV81EWQkXz8K0HmSrg9EltbLgDXJ1AHet82gC7d6QSvQIH2r9roC2KtZczqxQpYjO4
	 vKfz1dujDuU9mF09I/ennIRROskpCWD+FUIF0hLS1zlo2D8d+p4edIYGa7hqGbAUkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153486;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=dRf6oI9OjFWY1cb4Veae1z+HSgCdbz4ogw7DjgHpwGM=;
	b=fXBZ+hiVHa3PG4BHtgKrNbxMRLH5vYOCACTxTVj/XK+wvnKRGl5lXjuZaztvg/kw0g3c
	 976hgN6WCj2ijyL6IWlt8UyS56YWz3U32suMhM4f+P91P0Bm6zILLEaNBCdXsodaepkHO
	 S+FK/iaLnEX/WWqg1NU8D/Tty6lhzanqvYDy1hy7InClCv4PP5edPK+n1GgZFQ5DW2uGi
	 IhbKCfD1R/Xnx0JhbUPdLaLyX0JUBsJXxs9o7FShxZWXyZIJTZidxqg/VMdfazNszKJ58
	 ovFEvZ401mLPjToovCn/E/WO8gSGF2rNDJxFrAQAbZxWxOmmmx+r3G8gZ8N0PCRvzcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qYpt+RJw;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B5606A320;
	Wed, 28 Oct 2026 02:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=qYpt+RJw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=dRf6oI9OjFWY1cb4Veae1z+HSgCdbz4ogw7DjgHpwGM=;
	b=qYpt+RJwRCF0KX/+Je23SE2RJtdg8sWfRlTJBYkgQjazqIosKZrPy7BmiKqm9R
	lMeSBT6H/smy5N567aYskw3soxO2lZEjFu6+3moV22mJgNt2lfVoA1/U+RSmdIP+
	eNPBKt+kFxH/QXb7xPiQMm1mkDGc1IgvPyHBAIFAj2h4o=
Message-ID: <9a761c42-9edd-48f4-b3a4-c275b603cc3e@163.com>
Date: Wed, 28 Oct 2026 10:10:33 +0800
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
Subject: Re: [PATCH v4 00/16] PCI: dwc: Cache PCIe capability offset
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, jingoohan1@gmail.com, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027231534.GA520774@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20261027231534.GA520774@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD33x2jWeFqyfNqDQ--.48494S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DJr17Xr4kCw1xZw47urg_yoW8Xr4kpF
	Wjgrs2yF4kXrn2vanF93Wj93W7AF9Iy3y3CanxG34avr90vF4IgF40vrW3GF9Fyrs29r4a
	yFWjq3s8Gas8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4UDXUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ASSNmrhWaRq6QAA35



On 10/28/26 07:15, Bjorn Helgaas wrote:
> On Tue, Oct 27, 2026 at 08:28:11PM +0800, Hans Zhang wrote:
>> Hi,
>>
>> The DWC PCIe core and its platform drivers repeatedly call
>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>> PCI Express Capability structure, including in paths that run more than
>> once such as link polling, suspend/resume and interrupt handlers.
>>
>> Add a cached pcie_cap field to struct dw_pcie and a
>> dw_pcie_get_pcie_cap() helper that performs the lookup on first use and
>> caches the result, then convert the core and the 14 platform drivers
>> that use PCI_CAP_ID_EXP.
>>
>> After this series, dw_pcie_find_capability(..., PCI_CAP_ID_EXP) no
>> longer appears in drivers/pci/controller/dwc/ outside of the helper
>> itself.
>> ...
> 
>> base-commit: 4352b8aee98005853aa63f57d6377282de17a33f
> 
> This does indeed apply cleanly on 4352b8aee980 ("Merge tag
> 'i3c/for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux"),
> but that's pretty old and not really useful any more.
> 
> PCI topic branches are typically based on -rc1, but of course v7.4-rc1
> hasn't been tagged.  Until it is, you can use pci/main as a good base.
> It's currently 17bb0e2f6c80 ("Merge tag 'pci-v7.4-changes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci"), so
> drivers/pci/ in v7.4-rc1 will be pretty close to that.

Hello Bjorn,

Will rebase on pci/main.

Best regards,
Hans


