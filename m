Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793576303;
	b=T+zxQbMtykJREe/gMUtV6ISMBDf5zyCT9mEobopBFwDUEAN3MEGZU8l70AsMMbhVH8eI
	 sAgKd1FYGu8TFNmvx+EEFZCQZ6I6Keb4Kn+pWbH42+bU0dectkFQ79xG4vMUyM0yB0WW3
	 TxxRC6vABqG/CQoahWFmUehNMKXg5k0Ihd33gcyhkYbb4chCDxvAlUxD87NkMKWj86Ydt
	 +orD3yQPGeo9hbGV9OMyFcRQGH6AF53mSjiBxZH+WXD5fPMWzVEwhLGgrvJgZcKf9JuRu
	 MoujoI/pqyj9CscFuXpmurtacAmzqU6ohHBHeenqhrzEq8ZvDq5pezZdYxQQZBCXYRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576303;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=;
	b=iEZNqDMaSwj5sKnt1TH/hsKzprLlXDSuEJbatcteBNoizyq8NUSh+fudkgBRsG6qCTOP
	 aPeynUDZNRw1guG5p4YNMQEv5TTvcFp1+F/r9OrfuT9SAfSbjve5PsOjBPjtltalwjk+T
	 2oMDqKbuOnp1w2TP8UIdOBT0K7fLCy7kYGUf5UcxNqBcXwq4BguFOh8Po20VkiQ3cVezR
	 PXyHogdIKOq1gJegnTxBH5VjVTtbik9BN0p5C4ZLC/GewcPBjkG8OTZZh5xbxX+QivlBR
	 hYjKduZ39VniiCmRXy2ksrJ+N+yXRXzhT8s1hv3CSq9smpiQecjj8u7jAunBMwfkLZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=k1cHl4mJ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=LZBK1gbk;
	arc=fail smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61B606A32D
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D61B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=k1cHl4mJ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=LZBK1gbk
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793576302;
	 b=xMWggtfVwN1Te61/ukm7fQRQGPGAzC4/gTmhvrL7YmMxwsZg9Uz1Vcs8UjFPHbHjITGfuTG8S0
	  3pnuLNdF+vwtv/cFPFufiJ/jKX1KIlF6KvI6tKc91pcVANxvx692dWXWvIEvvnz1YGb6l12PjJ
	  t1MbApSa7MELX5aOruDU+XYtYMiYIM6EJtY0QBzZwhxCLtPK1bzl392E/AwxdbB1Ds4xsb6NVb
	  mMHghSB+YK0Gdq3uBJ7/c79jQMAtXzf3gakmlUuehBOeD1VTTnMEic9vK9wBq5tVtWfehwlAt0
	  37iPR1xF6GiG/vZScsjL/TU2zukTktizk62UXyqzSRnmFg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793576302;
	bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=QpMoxTgw/QwbuZ+ZpS7o3jmoCpzy+8QOs+Lh7UQDnNqA++izxId8J4gD6ThgikhbZOpA2IoA71
	  phpeiFNhGMvOzkXLQ3aAx3797USOyGrsJtsenIhwu4hMg4yJLpEyd0AdfawS1XfGcIFkqH1EWT
	  /P/fMjU1rXj7yA/Yi6ZKP4xF7SGbecqvJJKKRbfB/q22jBhr5mMv5ExPltMJZD04yIAcV8Hw1L
	  iUbyr+zg1bqi8an8ZEQaw/hwEYFngQE89tAn9rQdhQSbiq4Xmt7FTxIUsEf0FWnr63qfTWUQJe
	  OB7SuJAgSDAk98XQEt7ei9QXditOaRbqAdUYVrSjP97Wkg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=k1cHl4mJaO1qQtlv0nSNWtKmPg
	Fb5tkeat8Zd6vHxEzx3om4m0vGwjcf7M7qV45YcxOfiXT72oUPPqGdTSKj8I+Ctcja36Lxxbx2jVZ
	6sgByBivKguA/ROwtF+GfIW+gZkHcbaK92Z4XBy1I5pZFM9dbM9v74ZXohanyPJjmY28=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNf7z-00000007D0O-3pCP
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KWf41TzVYDqHL4pTFUus8pIHhKH/ijmasendTpwykTU=; b=LZBK1gbkx1xKTU/yLEhk5AVcnx
	JZp/8TE38n9SCpNZy5oVP2C/OiqiXBfEDSVt5YspvCObs2UGDB+jWgKCJAjahy2HAXkBjUZ7k/zgJ
	TLP2Obf1xFhWwLUVaEwozxyl/n4PUdueBSTZkR3VYVMh6vmraNDp1+HZ22ZTy+1wkwdg=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex4-000000002I5-1jEm;
	Sun, 01 Nov 2026 23:27:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:47 +0100
Subject: [PATCH RFC v2 10/11] dt-bindings: remoteproc: imx-rproc: support
 virtio
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-10-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=francesco@valla.it;
 h=from:subject:message-id; bh=W8xnIBvS7wOydEJdbm8IEFFIvhRv58/EitM/q4dFv+4=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+35GL1ZfeoOluP6+64JCXXfWsylzcvLXc/97ab0v
 MsHOnds7ChlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmMn83I8Mc09lCMadyH+XN
 WrZeT3teRIfIkeehx+8H9+2aGLtJ9kIww/+6G/cMToYLN8Y4vg5M1lf+v8eYw2kiy6yQK8tn8O3
 2V+EGAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 65ef13d9808a0701c9617bf0e7a4a94a
X-AntiAbuse: ID - 65ef13d9808a0701c9617bf0e7a4a94a
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNf7z-00000007D0O-3pCP-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add support for virtio devices description for i.MX remoteproc devices.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..32fc415c7028 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -92,6 +92,7 @@ required:
   - compatible
 
 allOf:
+  - $ref: remoteproc-virtio.yaml#
   - if:
       properties:
         compatible:
@@ -118,7 +119,7 @@ allOf:
       properties:
         power-domains: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

