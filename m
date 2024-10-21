Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611A1E1C22
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502879; cv=none; b=suzxlRGIfH3IAhgOoy45eP8sd1RaHVIClRlx4GymGd1OBX1HGYk3Rp3OOZkkGUoqp0h4ddq0psPMpLXKMPvKtqll9Wp4uhL7aaxyLJB/9y77D3kzgRV7WEEI+C54aQACl4+zKgfF1Jknt4ZW3myQ+tyNMAG9KRuX1gOyUVMPdqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502879; c=relaxed/simple;
	bh=ll7At9nIH9NUcF3cfpSsh7DnwpHJyoRpUcmDz8PvqeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RryTYIaNmxABkE108RzUL8VLEXQUzVqIumzpuTRAy4KUuFHaMev56JOBnlI6MMzpsVA4q08DfAl1rO0f/TolT7XbxKTq52WMtk2pecQA6moZO0JeLVI1FV/Y6+9DGQiqc+qZdBW7LSwfCEYWwk3uf8DYj+68phLKULTblM42GIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hZAPVk0B; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hZAPVk0B"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F6A01F910;
	Mon, 21 Oct 2024 11:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729502867;
	bh=mSgpzAFgc/z8kyQlEP+bYSHF4QmpnixYUN3WVSsK7sE=; h=From:To:Subject;
	b=hZAPVk0BpGHOPRa87cRaWp3nX9mkTjq4rVaSOFaEpg6pLB1SWACbmRkUUA3i5M2s8
	 4BHJnNURc2wYCo413nuyAI8AEMkYksjXqHQ/oX5u24jVgAUKptClzfMW0tkZBOkAOy
	 jT1G8BA2F6bSfZ/0ZOSl5qZEdu3SszIlY97HpJHD4Ya8RWdzpP7W3eUu/Yy+z/C1Gu
	 ownS2rjyZ7Z4i8OLavxbqdrxTeG4PcrBiIpIaR+6AR2YiA5Fs0jPoxDCEXoPqQieKY
	 WYkii8iaSwPaNMMiaGzFkLKdCGFXldMD4IPh42U6oWIg5ZWWtvjw+aVuYRgNaFpzA7
	 7ittoMivMBVDg==
Date: Mon, 21 Oct 2024 11:27:43 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: carlos.song@nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, frank.li@nxp.com, haibo.chen@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx7s: change i2c compatible string for
 applying errata ERR007805
Message-ID: <20241021092743.GA21104@francesco-nb>
References: <20241021031148.2682015-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021031148.2682015-1-carlos.song@nxp.com>

Hello Carlos,

On Mon, Oct 21, 2024 at 11:11:48AM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
> 
> Replace "fsl,imx7d-i2c" by "fsl,imx7s-i2c" compatible string in dts
> file for appling the errata ERR007805.

Did you considered changing the driver instead? If I understand this
correctly it would be a better solution.

Francesco

