Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AA2459C6
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130123; cv=none; b=Rah+W1OXGgEkKvWuux4lydnHWw226zpsGQBpUdY8GRXXsrTDpW+dT4Ufd+kAzS8ZF7p0JCmmK8QQS83ToiLFfOkuquibcEY8JqolnKzMFGgw2iEDV7iTE8UiymIC1icvdpJBry0cXU6bhZ34z+03pBW7K1RkG7OT525wix+pDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130123; c=relaxed/simple;
	bh=TXRBFCdPNOdXwsdpIwHq+ys67MeGt75S0Ptkn0eY0X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4XPdrEqA5Q3OxxeulkG7MdCr9r9lchiFj5PryHHu+LSdxoJ9l8WEuIbGjil6LqEj3mWTKktYX1d6LcQbRxKXy3L3BPTOLn25kENzyBbFAM5vw1G2QupOtVhBL/f+8jWZ4XSjQCOxltGSsAL8QbXEuPa5BfZZO2341DrnLzRxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=B7vSbpSU; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="B7vSbpSU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D34110B69B;
	Tue, 30 Dec 2025 22:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130113;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zbZdVAaFTWODcICt4oidtE+rwPVgQ3ermHb4FrC1pcU=;
	b=B7vSbpSUi6h+kYRi3xoSUxZaswBPtS5ejaB8EUL03cR7JIkAS9r2S8jY21jEJNraM8dGt3
	bPAwT2pPxmXdN0vVVc4Wssu/0Yim68CV1QyQsE19AQv8E2SisQ9yFJU/N2r889oxi4oei7
	Bg49NeZZuksUWCy3WhXpTluujOwdyq5QBRPgcZGUlTbr1dhuSTzF+ixS0tlxX/wkfqrd2X
	Wncix6hm3r21NzgrbmlvcsIjOVv3f8JvNun8Spi4PBMjSfpjAnw6KFkbTq7qhUpsXWdSSH
	6/Sbv/TLsG07ChTV1/yI/DMlAftY5pruK0++De4KI/nNJKVgf0HmGn1zUqA0dQ==
Message-ID: <8df1ff09-a5be-418f-9723-3f64bf97eba8@nabladev.com>
Date: Tue, 30 Dec 2025 22:28:27 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251230184121.52635-1-marex@nabladev.com>
 <20251230184121.52635-4-marex@nabladev.com>
 <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAOMZO5Aa6iDg2u-sJu1yPZX8T2wE=QVzwSbxjZHo1bMwfDW5HQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/25 7:52 PM, Fabio Estevam wrote:
> On Tue, Dec 30, 2025 at 3:41 PM Marek Vasut <marex@nabladev.com> wrote:
> 
>> +&gpio4 {
>> +       /*
>> +        * Hog USB-nRESET high here, since neither U-Boot nor Linux
>> +        * has any support for USB Hub GPIO reset so far.
> 
> Which USB hub chip is used?
USB2512B , so I can use this.

Both temp sensor node names are also updated.

Thanks.
