Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B74014B8;
	Fri,  6 Mar 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816991; cv=none; b=l0ihmQPckRO22nfzTH9WPrkSvqNK1TZoQ7QoOxdKTzgLziSNdikTxqyLwhpRmQUOU2i3nTHEeuy6m9L76a4pq0HbU64JbM0UsBNTuJ4+tk2vdxEEHBYPbavUMAJSOPHqlrcSdJVkMl9Z1ngDRgOwu/f/lhd0K1edkmiGBCxUWBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816991; c=relaxed/simple;
	bh=VsXE+svD0ozIQDDFOgt45cd6eXjH7nxp9XTye3IloGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h035zultPsT4InoJpkLCl861Arvom5sVh0Fu6JycdYyJFc1lpU3WYEMX+D8VwA2PrUgq9/tFF6tmpOwHpaNdkhAfdyMHXM7XjDGzTPPN4k6cIfFkO/aod7rBxfWMmLkja69+8Qy+l3kjlXokq4pFSt3ZhKyoeUAOBzXULvdjhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=l9YUV9Hd; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="l9YUV9Hd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VsXE+svD0ozIQDDFOgt45cd6eXjH7nxp9XTye3IloGc=; b=l9YUV9HdlLX1HfeKUqfDNoU5YI
	CXhnjJjxxN09CLqR+AHoeDH8353f4NYCDNtqXDEfiaFOjMVS4l462dWrRo+KWmhB31SnQTbSbVxI6
	IuZbWb/nuh/8t51OhOr5Jb7TkinDYH7E2qeTXj/mwjLQ9uVuXCvtsWTaGC5Jr/vO1sHx3u73RSoUy
	CFhzNduiEBY388G13kQaPZ7HCk5ToAxKoqm6QjV2AnlpPrr7bjSb2r6XnCP0xgcTmyYKcq9x+oLJL
	do97pKp8inQqRzyTOyo+PqAlaa08/Hsh/yxXEJlxrLgz3RN09y+HSieY0rW4+uQA60JCsGVoA1yh+
	SuCUKsKw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.feilke@ew.tq-group.com>)
	id 1vyYgG-000JfL-16;
	Fri, 06 Mar 2026 18:09:40 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.feilke@ew.tq-group.com>)
	id 1vyYgF-000KT5-2p;
	Fri, 06 Mar 2026 18:09:39 +0100
Message-ID: <6db90740-5a89-47dd-a789-98b96b202a1a@ew.tq-group.com>
Date: Fri, 6 Mar 2026 18:09:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 0/3] ARM: dts: TQMa7: modify for use in bootloaders
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
From: "Feilke, Alexander" <alexander.feilke@ew.tq-group.com>
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27932/Fri Mar  6 08:24:27 2026)


> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
>
> V2:
> - Updated commit messages
> - Added missing QSPI bootph properties to imx7-tqma7.dtsi
Any update on this?
